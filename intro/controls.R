
## ----setup, echo = F, results = 'asis', cache = F------------------------
library(knitr)
opts_chunk$set(tidy = F, comment = NA, results = 'html')
options(rcharts.mode = 'iframe', rcharts.cdn = TRUE)


## ----controls-polychart1-------------------------------------------------
library(rCharts)
n1 <- rPlot(mpg ~ wt, data = mtcars, color = "gear", type = "point")
n1


## ----controls-polychart2, results = 'hide', cache = F--------------------
n1$addControls("x", value = "wt", values = names(mtcars))
n1$addControls("y", value = "wt", values = names(mtcars))
n1$addControls("color", value = "gear", values = names(mtcars))
n1


## ----controls-nvd31, results = 'hide'------------------------------------
HairEye <- subset(as.data.frame(HairEyeColor), Sex == "Male")
n1 <- nPlot(Freq ~ Eye, data = HairEye, group = 'Hair', type = 'multiBarChart')
n1$addControls("type", "multiBarChart", 
  values = c('multiBarChart', 'multiBarHorizontalChart')
)
n1$setTemplate(script = system.file('libraries', 'nvd3', 'controls', 'datgui.html', package = 'rCharts'))
n1$set(width = 650, height = 500)
n1


