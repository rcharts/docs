.. quickstart:

Quick Start
===========

You can install rCharts from github using the devtools package

.. sourcecode:: r

	require(devtools)
	install_github('rCharts', 'ramnathv')


The design philosophy behind rCharts is to make the process of creating, customizing and sharing interactive visualizations easy.

**Create**


rCharts uses a formula interface to specify plots, just like the lattice package. Here are a few examples you can try out in your R console.

.. sourcecode:: r

	require(rCharts)

	## Example 1 Facetted Scatterplot
	names(iris) = gsub("\\.", "", names(iris))
	rPlot(SepalLength ~ SepalWidth | Species, data = iris, color = 'Species', type = 'point')

	## Example 2 Facetted Barplot
	hair_eye = as.data.frame(HairEyeColor)
	rPlot(Freq ~ Hair | Eye, color = 'Eye', data = hair_eye, type = 'bar')

**Customize**


rCharts supports multiple javascript charting libraries, each with its own strengths. Each of these libraries has multiple customization options, most of which are supported within rCharts.


**Share**


rCharts allows you to share your visualization in multiple ways, as a standalone page, embedded in a shiny application, or embedded in a tutorial/blog post.

**Publish to Gist/RPubs**

.. sourcecode:: r

	names(iris) = gsub("\\.", "", names(iris))
	r1 <- rPlot(SepalLength ~ SepalWidth | Species, data = iris, 
	  color = 'Species', type = 'point')
	r1$publish('Scatterplot', host = 'gist')
	r1$publish('Scatterplot', host = 'rpubs')

**Use with Shiny**

rCharts is easy to embed into a Shiny application using the utility functions renderChart and showOutput. Here is an example of an rCharts Shiny App.

.. sourcecode:: r

	## server.r
	require(rCharts)
	shinyServer(function(input, output) {
	  output$myChart <- renderChart({
	    names(iris) = gsub("\\.", "", names(iris))
	    p1 <- rPlot(input$x, input$y, data = iris, color = "Species", 
	      facet = "Species", type = 'point')
	    return(p1)
	  })
	})

	## ui.R
	require(rCharts)
	shinyUI(pageWithSidebar(
	  headerPanel("rCharts: Interactive Charts from R using polychart.js"),

	  sidebarPanel(
	    selectInput(inputId = "x",
	     label = "Choose X",
	     choices = c('SepalLength', 'SepalWidth', 'PetalLength', 'PetalWidth'),
	     selected = "SepalLength"),
	    selectInput(inputId = "y",
	      label = "Choose Y",
	      choices = c('SepalLength', 'SepalWidth', 'PetalLength', 'PetalWidth'),
	      selected = "SepalWidth")
	  ),
	  mainPanel(
	    showOutput("myChart", "polycharts")
	  )
	))

Credits
-------

Most of the implementation in ``rCharts`` is inspired by `rHighcharts <https://github.com/metagraf/rHighcharts>`_ and `rVega <https://github.com/metagraf/rVega>`_. I have reused some code from these packages verbatim, and would like to acknowledge the efforts of its author `Thomas Reinholdsson <https://github.com/reinholdsson>`_, who has since merged his `rHighcharts <https://github.com/metagraf/rHighcharts>`_ package into rCharts. I would also like to thank `@timelyportfolio <https://github.com/timelyportfolio>`_ for adding `Dimple JS <http://dimplejs.org>`_ to rCharts, as well as for his contagious enthusiasm, which has egged me on constantly.

License
-------

rCharts is licensed under the MIT License. However, the JavaScript charting libraries that are included with this package are licensed under their own terms. All of them are free for non-commercial and commercial use, with the exception of **Polychart** and **Highcharts**, both of which require paid licenses for commercial use. For more details on the licensing terms, you can consult the ``License.md`` file in each of the charting libraries.

See Also
--------

There has been a lot of interest recently in creating packages that allow R users to make use of Javascript charting libraries. 

- `ggvis <http://ggvis.rstudio.com>`_ by `RStudio <http://rstudio.com>`_
- `clickme <https://github.com/nachocab/clickme>`_ by `Nacho Caballero <https://github.com/nachocab>`_

.. raw:: html

   <style>body {text-align: justify;}</body>