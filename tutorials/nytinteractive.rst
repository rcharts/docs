.. _nytinteractive:

Visualizing Strikeouts
=======================

This tutorial explains in detail, how I used ``rCharts`` to replicate this NY times `interactive graphic <http://www.nytimes.com/interactive/2013/03/29/sports/baseball/Strikeouts-Are-Still-Soaring.html?ref=baseball>`_ on strikeouts in baseball. The end result can be seen `here <http://glimmer.rstudio.com/ramnathv/strikeouts>`_ as a ``shiny`` application.





Data
----

The first step is to get data on strikeouts by team across years. The NY Times graphic uses data scraped from `baseball-reference <http://www.baseball-reference.com/>`_, using the ``XML`` package in R. However, I will be using data from the R package `Lahman <http://cran.r-project.org/web/packages/Lahman/index.html>`_, which provides tables from `Sean Lahman's Baseball Database <http://www.seanlahman.com/baseball-archive/statistics/>`_ as a set of data frames.

The data processing step involves using the `plyr <http://cran.r-project.org/web/packages/plyr/index.html>`_ package to create two data frames:

1. ``team_data`` containing ``SOG`` (strikeouts per game) by ``yearID`` and team ``name``
2. ``league_data`` containing ``SOG`` by `yearID` averaged across the league.



.. sourcecode:: r
    

    require(Lahman) ; require(plyr); library(ascii)
    dat = Teams[,c('yearID', 'name', 'G', 'SO')]
    team_data = na.omit(transform(dat, SOG = round(SO/G, 2)))
    league_data = ddply(team_data, .(yearID), summarize, SOG = mean(SOG))
    ascii(head(team_data), type = 'rst')

+---+---------+-------------------------+-------+-------+------+
|   | yearID  | name                    | G     | SO    | SOG  |
+===+=========+=========================+=======+=======+======+
| 1 | 1871.00 | Boston Red Stockings    | 31.00 | 19.00 | 0.61 |
+---+---------+-------------------------+-------+-------+------+
| 2 | 1871.00 | Chicago White Stockings | 28.00 | 22.00 | 0.79 |
+---+---------+-------------------------+-------+-------+------+
| 3 | 1871.00 | Cleveland Forest Citys  | 29.00 | 25.00 | 0.86 |
+---+---------+-------------------------+-------+-------+------+
| 4 | 1871.00 | Fort Wayne Kekiongas    | 19.00 | 9.00  | 0.47 |
+---+---------+-------------------------+-------+-------+------+
| 5 | 1871.00 | New York Mutuals        | 33.00 | 15.00 | 0.45 |
+---+---------+-------------------------+-------+-------+------+
| 6 | 1871.00 | Philadelphia Athletics  | 28.00 | 23.00 | 0.82 |
+---+---------+-------------------------+-------+-------+------+



Charts
------

We will start by first creating a scatterplot of `SOG` by `yearID` across all teams. We use the `rPlot` function which uses the PolyChartsJS library to create interactive visualizations. The formula interface specifies the x and y variables, the data to use and the type of plot. We  also specify a `size` and `color` argument to style the points. Finally, we pass a `tooltip` argument, which is a javascript function that overrides the default tooltip to display the information we require. You will see below the R code and the resulting chart.



.. sourcecode:: r
    

    require(rCharts)
    p1 <- rPlot(SOG ~ yearID, data = team_data, 
      type = "point", 
      size = list(const = 2), 
      color = list(const = "#888"), 
      tooltip = "#! function(item){
        return item.SOG + ' ' + item.name + ' ' + item.yearID
       } !#"
    )
    p1


.. only:: html

    
    .. raw:: html
        
    
        <iframe src='
        ../_downloads/chart1.html
        ' scrolling='no' seamless
        class='rChart polycharts '
        id=iframe-
        chart15d57750314e7
        ></iframe>
        <style>iframe.rChart{ width: 100%; height: 400px;}</style>




:download:`Standalone <_downloads/chart1.html>`


Now, we need to add a line plot of the  average ``SOG`` for the league by ``yearID``. We do this by adding a second layer to the chart, which copies the elements of the previous layer and overrides the ``data``, `type`, ``color`` and ``tooltip`` arguments. The R code is shown below and you will note that the resulting chart now shows a blue line chart corresponding to the league average ``SOG``.



.. sourcecode:: r
    

    p1$layer(data = league_data, type = 'line', 
      color = list(const = 'blue'), copy_layer = T, tooltip = NULL)
    p1


.. only:: html

    
    .. raw:: html
        
    
        <iframe src='
        ../_downloads/chart2.html
        ' scrolling='no' seamless
        class='rChart polycharts '
        id=iframe-
        chart15d57750314e7
        ></iframe>
        <style>iframe.rChart{ width: 100%; height: 400px;}</style>




:download:`Standalone <_downloads/chart2.html>`

Finally, we will overlay a line plot of ``SOG`` by ``yearID`` for a specific team `name`. Later, while building the shiny app, we will turn this into an input variable that a user can choose from a dropdown menu. We use the layer approach used earlier and this time override the `data` and `color` arguments so that the line plot for the team stands out from the league average.


.. sourcecode:: r
    

    myteam = "Boston Red Sox"
    p1$layer(data = team_data[team_data$name == myteam,], 
      color = list(const = 'red'),
      copy_layer = T)
    p1$set(dom = 'chart3')
    p1


.. only:: html

    
    .. raw:: html
        
    
        <iframe src='
        ../_downloads/chart3.html
        ' scrolling='no' seamless
        class='rChart polycharts '
        id=iframe-
        chart3
        ></iframe>
        <style>iframe.rChart{ width: 100%; height: 400px;}</style>




:download:`Standalone <_downloads/chart3.html>`

Let us add a little more interactivity to the chart. To keep it simple, we will use handlers in PolychartJS to initiate an action when a user clicks on a point. The current handler is a simple one, which just displays the name of the team clicked on. If you are familiar with Javascript event handlers, the code should be self explanatory.



.. sourcecode:: r
    

    p2 <- p1$copy()
    p2$setTemplate(afterScript = '
      <script>
        graph_chart3.addHandler(function(type, e) {
          var data;
          data = e.evtData;
          if (type === "click") {
            return alert("You clicked on the team: " + data.name["in"][0]);
          }
        });
      </script>
    ')
    p2


.. only:: html

    
    .. raw:: html
        
    
        <iframe src='
        ../_downloads/interactivity.html
        ' scrolling='no' seamless
        class='rChart polycharts '
        id=iframe-
        chart3
        ></iframe>
        <style>iframe.rChart{ width: 100%; height: 400px;}</style>




:download:`Standalone <_downloads/interactivity.html>`

Application
------------

Now it is time to convert this into a Shiny App. We will throw the data processing code into `global.R` so that it can be accessed both by `ui.R` and `server.R`. For the dropdown menu allowing users to choose a specific team, we will restrict the choices to only those which have data for more than 30 years. Accordingly, we have the following `global.R`.


.. sourcecode:: r
    

    ## global.R
    require(Lahman); require(plyr)
    dat = Teams[,c('yearID', 'name', 'G', 'SO')]
    team_data = na.omit(transform(dat, SOG = round(SO/G, 2)))
    league_data = ddply(team_data, .(yearID), summarize, SOG = mean(SOG))
    THRESHOLD = 30
    team_appearances = count(team_data, .(name))
    teams_in_menu = subset(team_appearances, freq > THRESHOLD)$name



For the UI, we will use a bootstrap page with controls being displayed in the sidebar. Shiny makes it really easy to create a page like this. See the annotated graphic below and the `ui.R` code that accompanies it to understand how the different pieces fit together.

.. raw:: html

  <a href='http://glimmer.rstudio.com/ramnathv/strikeouts'>
    <img src="http://i.imgur.com/QS0x32b.png">
  </a>


We now need to write the server part of the shiny app. Thankfully, this is the easiest part, since it just involves wrapping the charting code inside `renderChart` and replacing user inputs to enable reactivity. We add a few more lines of code to set the height and title and remove the axis titles, since they are self explanatory.
