.. _intro:

Create
======

rCharts uses a formula interface to specify plots, just like the lattice package. Here are a few examples you can try out in your R console.

.. note::

   Every example comes with an edit button that allows you to experiment with the code online. The online playground was built using `OpenCPU <http://opencpu.org>`_


.. toctree::
   :maxdepth: 2

   intro/index




First let us load the ``rCharts`` package


.. sourcecode:: r
    

    library(rCharts)




Polycharts
----------


.. sourcecode:: r
    

    r1 <- rPlot(mpg ~ wt, data = mtcars, type = 'point')
    r1


.. only:: html

    
    .. raw:: html
        
    
        <iframe src='
        ../_downloads/intro-polychart.html
        ' scrolling='no' seamless
        class='rChart polycharts '
        id=iframe-
        chart1c8b238179a6
        ></iframe>
        <style>iframe.rChart{ width: 100%; height: 400px;}</style>





.. raw:: html
    

    
        <a href="../playground.html#?n=intro-polychart" class="btn btn-success btn-mini float-right" target="_blank">
          <span class="fa fa-edit"></span> Edit
        </a><br/>
      


:download:`Standalone <_downloads/intro-polychart.html>` 


.. only:: latex

   .. image:: _downloads/chart1.png




NVD3
----


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
        ../_downloads/intro-nvd3.html
        ' scrolling='no' seamless
        class='rChart nvd3 '
        id=iframe-
        chart1c8b57e2bd4b
        ></iframe>
        <style>iframe.rChart{ width: 100%; height: 400px;}</style>





.. raw:: html
    

    
        <a href="../playground.html#?n=intro-nvd3" class="btn btn-success btn-mini float-right" target="_blank">
          <span class="fa fa-edit"></span> Edit
        </a><br/>
      


.. only:: html

   :download:`Standalone <_downloads/intro-nvd3.html>`

.. only:: latex

   .. image:: _downloads/intro-nvd3.pdf
      :scale: 75 %
      :align: center


`View Interactive <_downloads/intro-nvd3.html>`_



Morris
------


.. sourcecode:: r
    

    data(economics, package = "ggplot2")
    econ <- transform(economics, date = as.character(date))
    m1 <- mPlot(x = "date", y = c("psavert", "uempmed"), type = "Line", data = econ)
    m1$set(pointSize = 0, lineWidth = 1)
    m1


.. only:: html

    
    .. raw:: html
        
    
        <iframe src='
        ../_downloads/intro-morris.html
        ' scrolling='no' seamless
        class='rChart morris '
        id=iframe-
        chart1c8b1398a0d1
        ></iframe>
        <style>iframe.rChart{ width: 100%; height: 400px;}</style>





.. raw:: html
    

    
        <a href="../playground.html#?n=intro-morris" class="btn btn-success btn-mini float-right" target="_blank">
          <span class="fa fa-edit"></span> Edit
        </a><br/>
      


:download:`Standalone <_downloads/intro-morris.html>`

Highcharts
-----------


.. sourcecode:: r
    

    h1 <- hPlot(x = "Wr.Hnd", y = "NW.Hnd", 
      data = MASS::survey, 
      type = c("line", "bubble", "scatter"), 
      group = "Clap", 
      size = "Age"
    )
    h1


.. only:: html

    
    .. raw:: html
        
    
        <iframe src='
        ../_downloads/intro-highcharts.html
        ' scrolling='no' seamless
        class='rChart highcharts '
        id=iframe-
        chart1c8b8689f0e
        ></iframe>
        <style>iframe.rChart{ width: 100%; height: 400px;}</style>





.. raw:: html
    

    
        <a href="../playground.html#?n=intro-highcharts" class="btn btn-success btn-mini float-right" target="_blank">
          <span class="fa fa-edit"></span> Edit
        </a><br/>
      


:download:`Standalone <_downloads/intro-highcharts.html>`

Rickshaw
--------



.. sourcecode:: r
    

    usp = reshape2::melt(USPersonalExpenditure)
    usp$Var2 <- as.numeric(as.POSIXct(paste0(usp$Var2, "-01-01")))
    p4 <- Rickshaw$new()
    p4$layer(value ~ Var2, group = "Var1", data = usp, type = "area")
    p4$set(slider = TRUE)
    p4


.. only:: html

    
    .. raw:: html
        
    
        <iframe src='
        ../_downloads/intro-rickshaw.html
        ' scrolling='no' seamless
        class='rChart rickshaw '
        id=iframe-
        chart1c8b75560ed8
        ></iframe>
        <style>iframe.rChart{ width: 100%; height: 400px;}</style>




:download:`Standalone <_downloads/intro-rickshaw.html>`


.. raw:: html
    

    
        <a href="../playground.html#?n=intro-rickshaw" class="btn btn-success btn-mini float-right" target="_blank">
          <span class="fa fa-edit"></span> Edit
        </a><br/>
      


xCharts
--------



.. sourcecode:: r
    

    require(reshape2)
    uspexp <- melt(USPersonalExpenditure)
    names(uspexp)[1:2] = c('category', 'year')
    x1 <- xPlot(value ~ year, group = 'category', data = uspexp, 
      type = 'line-dotted')
    x1


.. only:: html

    
    .. raw:: html
        
    
        <iframe src='
        ../_downloads/intro-xcharts.html
        ' scrolling='no' seamless
        class='rChart xcharts '
        id=iframe-
        chart1c8b64e8c316
        ></iframe>
        <style>iframe.rChart{ width: 100%; height: 400px;}</style>




:download:`Standalone <_downloads/intro-xcharts.html>`


.. raw:: html
    

    
        <a href="../playground.html#?n=intro-xcharts" class="btn btn-success btn-mini float-right" target="_blank">
          <span class="fa fa-edit"></span> Edit
        </a><br/>
      


.. raw:: html

	<br/><br/>
  <style>
    iframe.rChart{margin-bottom: 20px;}
    a.download{display: none;}
    a.button{color: black;}
    #rickshaw iframe.rChart{height: 450px;}</style>
  </style>

