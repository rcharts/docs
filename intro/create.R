
## ----setup, cache = F, echo = F------------------------------------------
library(rCharts)
options(
  RCHART_HEIGHT = 400, 
  RCHART_WIDTH = 600, 
  rcharts.cdn = TRUE, 
  rcharts.mode = 'iframe'
)


## ------------------------------------------------------------------------
library(rCharts)


## ----intro-polychart, message = F, results = 'html', comment = NA--------
r1 <- rPlot(mpg ~ wt, data = mtcars, type = 'point')
r1


## ----results = 'asis', comment = NA, echo = F----------------------------
make_edit_button('intro-polychart')


## ----intro-nvd3, message = F, results = 'html', comment = NA-------------
hair_eye = as.data.frame(HairEyeColor)
p2 <- nPlot(Freq ~ Hair, group = 'Eye', 
  data = subset(hair_eye, Sex == "Female"), 
  type = 'multiBarChart'
)
p2$chart(color = c('brown', 'blue', '#594c26', 'green'))
p2


## ----results = 'asis', comment = NA, echo = F----------------------------
make_edit_button('intro-nvd3')


## ----intro-morris, message = F, results = 'html', comment = NA-----------
data(economics, package = "ggplot2")
econ <- transform(economics, date = as.character(date))
m1 <- mPlot(x = "date", y = c("psavert", "uempmed"), type = "Line", data = econ)
m1$set(pointSize = 0, lineWidth = 1)
m1


## ----results = 'asis', comment = NA, echo = F----------------------------
make_edit_button('intro-morris')


## ----intro-highcharts, message = F, results = 'html', comment = NA, warning = F----
h1 <- hPlot(x = "Wr.Hnd", y = "NW.Hnd", 
  data = MASS::survey, 
  type = c("line", "bubble", "scatter"), 
  group = "Clap", 
  size = "Age"
)
h1


## ----results = 'asis', comment = NA, echo = F----------------------------
make_edit_button('intro-highcharts')


## ----intro-rickshaw, message = F, results = 'html', comment = NA, warning = F----
usp = reshape2::melt(USPersonalExpenditure)
usp$Var2 <- as.numeric(as.POSIXct(paste0(usp$Var2, "-01-01")))
p4 <- Rickshaw$new()
p4$layer(value ~ Var2, group = "Var1", data = usp, type = "area")
p4$set(slider = TRUE)
p4


## ----results = 'asis', comment = NA, echo = F----------------------------
make_edit_button('intro-rickshaw')


## ----intro-xcharts, message = F, results = 'html', comment = NA, warning = F----
require(reshape2)
uspexp <- melt(USPersonalExpenditure)
names(uspexp)[1:2] = c('category', 'year')
x1 <- xPlot(value ~ year, group = 'category', data = uspexp, 
  type = 'line-dotted')
x1


## ----results = 'asis', comment = NA, echo = F----------------------------
make_edit_button('intro-xcharts')


