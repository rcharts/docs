.. _intro:

Create
=============

.. toctree::
   :maxdepth: 2

   intro/index





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
        chart184762f7bd9a9
        ></iframe>
        <style>iframe.rChart{ width: 100%; height: 400px;}</style>





.. raw:: html
    

    
        <a href="../playground.html#?n=intro-polychart" class="btn btn-success btn-mini float-right" target="_blank">
          <span class="fa fa-edit"></span> Edit
        </a><br/>
      


:download:`Standalone <_downloads/intro-polychart.html>` 


.. only:: latex

   .. image:: _knit/_figures/chart1.png




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
        chart184764c6d263b
        ></iframe>
        <style>iframe.rChart{ width: 100%; height: 400px;}</style>





.. raw:: html
    

    
        <a href="../playground.html#?n=intro-nvd3" class="btn btn-success btn-mini float-right" target="_blank">
          <span class="fa fa-edit"></span> Edit
        </a><br/>
      


:download:`Standalone <_downloads/intro-nvd3.html>`



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
        chart184765cc9e9ff
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
        chart184763077989c
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
        chart1847611f21434
        ></iframe>
        <style>iframe.rChart{ width: 100%; height: 400px;}</style>




:download:`Standalone <_downloads/intro-rickshaw.html>`


.. raw:: html
    

    
        <a href="../playground.html#?n=intro-rickshaw" class="btn btn-success btn-mini float-right" target="_blank">
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

