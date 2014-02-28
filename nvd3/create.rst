.. _nvd3_charttypes:

Create
=======

.. raw:: html

   <style>iframe.rChart{margin-bottom: 20px;}</style>

The `NVD3 <http://nvd3.org>`_ library supports most of the common chart types. 

.. contents::
   :local:
   :depth: 1


You can create an interactive plot making use of the NVD3 library using the :func:`nPlot` function.

.. list-table:: 
    :widths: 25 25 70
    :header-rows: 1

    * - Argument
      - Type
      - Description
    * - x
      - formula
      - A formula of the form y \~ x, with column names from the data frame.
    * - data
      - data frame
      - A data frame containing the data to be plotted
    * - type
      - string
      - The type of chart to plot
    * - group
      - string
      - Name of column based on which data should be grouped.







Scatter Chart
--------------


.. sourcecode:: r
    

    p1 <- nPlot(mpg ~ wt, group = 'cyl', data = mtcars, type = 'scatterChart')
    p1$xAxis(axisLabel = 'Weight')
    p1


.. only:: html

    
    .. raw:: html
        
    
        <iframe src='
        ../_downloads/nvd3-scatter.html
        ' scrolling='no' seamless
        class='rChart nvd3 '
        id=iframe-
        chart1868d3ffa04fc
        ></iframe>
        <style>iframe.rChart{ width: 100%; height: 400px;}</style>





.. raw:: html
    

    
        <a href="../playground.html#?n=nvd3-scatter" class="btn btn-success btn-mini float-right" target="_blank">
          <span class="fa fa-edit"></span> Edit
        </a><br/>
      


:download:`Standalone <_downloads/nvd3-scatter.html>`

Multibar Chart
--------------


.. sourcecode:: r
    

    hair_eye = as.data.frame(HairEyeColor)
    p2 <- nPlot(Freq ~ Hair, group = 'Eye', 
      data = subset(hair_eye, Sex == "Female"), 
      type = 'multiBarChart'
    )
    p2$chart(color = c('brown', 'blue', '#594c26', 'green'))
    p2


.. only:: html

    
    .. raw:: html
        
    
        <iframe src='
        ../_downloads/nvd3-multibar.html
        ' scrolling='no' seamless
        class='rChart nvd3 '
        id=iframe-
        chart1868d52921d51
        ></iframe>
        <style>iframe.rChart{ width: 100%; height: 400px;}</style>





.. raw:: html
    

    
        <a href="../playground.html#?n=nvd3-multibar" class="btn btn-success btn-mini float-right" target="_blank">
          <span class="fa fa-edit"></span> Edit
        </a><br/>
      


:download:`Standalone <_downloads/nvd3-multibar.html>`


Multibar Horizontal Chart
-------------------------



.. only:: html

    
    .. raw:: html
        
    
        <iframe src='
        ../_downloads/nvd3-multibar-horizontal.html
        ' scrolling='no' seamless
        class='rChart nvd3 '
        id=iframe-
        chart1868d72c46939
        ></iframe>
        <style>iframe.rChart{ width: 100%; height: 400px;}</style>








.. raw:: html
    

    
        <a href="../playground.html#?n=nvd3-multibar-horizontal" class="btn btn-success btn-mini float-right" target="_blank">
          <span class="fa fa-edit"></span> Edit
        </a><br/>
      


:download:`Standalone <_downloads/nvd3-multibar-horizontal.html>`

Pie Chart
----------


.. sourcecode:: r
    

    p4 <- nPlot(~ cyl, data = mtcars, type = 'pieChart')
    p4


.. only:: html

    
    .. raw:: html
        
    
        <iframe src='
        ../_downloads/nvd3-pie.html
        ' scrolling='no' seamless
        class='rChart nvd3 '
        id=iframe-
        chart1868d1f7c9b09
        ></iframe>
        <style>iframe.rChart{ width: 100%; height: 400px;}</style>





.. raw:: html
    

    
        <a href="../playground.html#?n=nvd3-pie" class="btn btn-success btn-mini float-right" target="_blank">
          <span class="fa fa-edit"></span> Edit
        </a><br/>
      


:download:`Standalone <_downloads/nvd3-pie.html>`

Donut Chart
------------


.. sourcecode:: r
    

    p5 <- nPlot(~ cyl, data = mtcars, type = 'pieChart')
    p5$chart(donut = TRUE)
    p5


.. only:: html

    
    .. raw:: html
        
    
        <iframe src='
        ../_downloads/nvd3-donut.html
        ' scrolling='no' seamless
        class='rChart nvd3 '
        id=iframe-
        chart1868dd1843ad
        ></iframe>
        <style>iframe.rChart{ width: 100%; height: 400px;}</style>





.. raw:: html
    

    
        <a href="../playground.html#?n=nvd3-donut" class="btn btn-success btn-mini float-right" target="_blank">
          <span class="fa fa-edit"></span> Edit
        </a><br/>
      


:download:`Standalone <_downloads/nvd3-donut.html>`

Line Chart
-----------


.. sourcecode:: r
    

    data(economics, package = 'ggplot2')
    p6 <- nPlot(uempmed ~ date, data = economics, type = 'lineChart')
    p6


.. only:: html

    
    .. raw:: html
        
    
        <iframe src='
        ../_downloads/nvd3-line.html
        ' scrolling='no' seamless
        class='rChart nvd3 '
        id=iframe-
        chart1868d3783daeb
        ></iframe>
        <style>iframe.rChart{ width: 100%; height: 400px;}</style>





.. raw:: html
    

    
        <a href="../playground.html#?n=nvd3-line" class="btn btn-success btn-mini float-right" target="_blank">
          <span class="fa fa-edit"></span> Edit
        </a><br/>
      


:download:`Standalone <_downloads/nvd3-line.html>`

Line with Focus Chart
---------------------


.. sourcecode:: r
    

    ecm <- reshape2::melt(
      economics[,c('date', 'uempmed', 'psavert')], 
      id = 'date'
    )
    p7 <- nPlot(value ~ date, group = 'variable', 
      data = ecm, 
      type = 'lineWithFocusChart'
    )
    p7


.. only:: html

    
    .. raw:: html
        
    
        <iframe src='
        ../_downloads/nvd3-line-with-focus.html
        ' scrolling='no' seamless
        class='rChart nvd3 '
        id=iframe-
        chart1868d5a79ba9a
        ></iframe>
        <style>iframe.rChart{ width: 100%; height: 400px;}</style>





.. raw:: html
    

    
        <a href="../playground.html#?n=nvd3-line-with-focus" class="btn btn-success btn-mini float-right" target="_blank">
          <span class="fa fa-edit"></span> Edit
        </a><br/>
      


:download:`Standalone <_downloads/nvd3-line-with-focus.html>`

Stacked Area Chart
-------------------


.. sourcecode:: r
    

    dat <- data.frame(
      t = rep(0:23, each = 4), 
      var = rep(LETTERS[1:4], 4), 
      val = round(runif(4*24,0,50))
    )
    p8 <- nPlot(val ~ t, group =  'var', data = dat, 
     type = 'stackedAreaChart', id = 'chart'
    )
    p8


.. only:: html

    
    .. raw:: html
        
    
        <iframe src='
        ../_downloads/nvd3-stacked-area.html
        ' scrolling='no' seamless
        class='rChart nvd3 '
        id=iframe-
        chart1868d6982337a
        ></iframe>
        <style>iframe.rChart{ width: 100%; height: 400px;}</style>





.. raw:: html
    

    
        <a href="../playground.html#?n=nvd3-stacked-area" class="btn btn-success btn-mini float-right" target="_blank">
          <span class="fa fa-edit"></span> Edit
        </a><br/>
      


:download:`Standalone <_downloads/nvd3-stacked-area.html>`

Multi Chart
-----------


.. sourcecode:: r
    

    p12 <- nPlot(value ~ date, group = 'variable', data = ecm, type = 'multiChart')
    p12$set(multi = list(
      uempmed = list(type="area", yAxis=1),
      psavert = list(type="line", yAxis=2)
    ))
    p12$setTemplate(script = system.file(
      "/libraries/nvd3/layouts/multiChart.html",
      package = "rCharts"
    ))
    p12


.. only:: html

    
    .. raw:: html
        
    
        <iframe src='
        ../_downloads/nvd3-multi-chart.html
        ' scrolling='no' seamless
        class='rChart nvd3 '
        id=iframe-
        chart1868d918f68d
        ></iframe>
        <style>iframe.rChart{ width: 100%; height: 400px;}</style>





.. raw:: html
    

    
        <a href="../playground.html#?n=nvd3-multi-chart" class="btn btn-success btn-mini float-right" target="_blank">
          <span class="fa fa-edit"></span> Edit
        </a><br/>
      


:download:`Standalone <_downloads/nvd3-multi-chart.html>`


.. raw:: html

  <br/><br/>
  <style>
    iframe.rChart{margin-bottom: 20px;}
    a.download{display: none;}
    a.button{color: black;}
    #rickshaw iframe.rChart{height: 450px;}</style>
  </style>
