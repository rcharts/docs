
## ----setup, tidy = F, cache = F, echo = F--------------------------------
library(rCharts)
options(
  rcharts.mode = 'iframe', 
  rcharts.cdn = TRUE,
  RCHART_WIDTH = 700,
  RCHART_HEIGHT = 450
)
library(knitr)
opts_chunk$set(tidy = F, results = 'asis', comment = NA, results = 'html')


## ----nvd3-scatter--------------------------------------------------------
p1 <- nPlot(mpg ~ wt, group = 'cyl', data = mtcars, type = 'scatterChart')
p1$xAxis(axisLabel = 'Weight')
p1


## ----nvd3-multibar-------------------------------------------------------
hair_eye = as.data.frame(HairEyeColor)
p2 <- nPlot(Freq ~ Hair, group = 'Eye', 
  data = subset(hair_eye, Sex == "Female"), 
  type = 'multiBarChart'
)
p2$chart(color = c('brown', 'blue', '#594c26', 'green'))
p2


## ----nvd3-multibar-horizontal, echo = F----------------------------------
p3 <- nPlot(~ cyl, group = 'gear', data = mtcars, type = 'multiBarHorizontalChart')
p3$chart(showControls = F)
p3


## ----results = 'asis', echo = F------------------------------------------
latex_image('nvd3-multibar-horizontal')


## ----nvd3-pie------------------------------------------------------------
p4 <- nPlot(~ cyl, data = mtcars, type = 'pieChart')
p4


## ----nvd3-donut----------------------------------------------------------
p5 <- nPlot(~ cyl, data = mtcars, type = 'pieChart')
p5$chart(donut = TRUE)
p5


## ----nvd3-line-----------------------------------------------------------
data(economics, package = 'ggplot2')
p6 <- nPlot(uempmed ~ date, data = economics, type = 'lineChart')
p6


## ----nvd3-line-with-focus------------------------------------------------
ecm <- reshape2::melt(
  economics[,c('date', 'uempmed', 'psavert')], 
  id = 'date'
)
p7 <- nPlot(value ~ date, group = 'variable', 
  data = ecm, 
  type = 'lineWithFocusChart'
)
p7


## ----nvd3-stacked-area---------------------------------------------------
dat <- data.frame(
  t = rep(0:23, each = 4), 
  var = rep(LETTERS[1:4], 4), 
  val = round(runif(4*24,0,50))
)
p8 <- nPlot(val ~ t, group =  'var', data = dat, 
 type = 'stackedAreaChart', id = 'chart'
)
p8


## ----nvd3-multi-chart----------------------------------------------------
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


