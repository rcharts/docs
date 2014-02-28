
## ----setup, cache = F, echo = F------------------------------------------
library(rCharts)
options(
  RCHART_HEIGHT = 400, 
  RCHART_WIDTH = 600, 
  rcharts.cdn = TRUE, 
  rcharts.mode = 'iframe'
)


## ----comment = NA, results = 'asis', message = F, warning = F------------
require(Lahman) ; require(plyr); library(ascii)
dat = Teams[,c('yearID', 'name', 'G', 'SO')]
team_data = na.omit(transform(dat, SOG = round(SO/G, 2)))
league_data = ddply(team_data, .(yearID), summarize, SOG = mean(SOG))
ascii(head(team_data), type = 'rst')


## ----chart1, comment = NA, results = 'html'------------------------------
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


## ----chart2, comment = NA, results = 'html'------------------------------
p1$layer(data = league_data, type = 'line', 
  color = list(const = 'blue'), copy_layer = T, tooltip = NULL)
p1


## ----chart3, results='html', comment = NA--------------------------------
myteam = "Boston Red Sox"
p1$layer(data = team_data[team_data$name == myteam,], 
  color = list(const = 'red'),
  copy_layer = T)
p1$set(dom = 'chart3')
p1


## ----interactivity, comment = NA, results = 'html'-----------------------
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


## ----eval = F------------------------------------------------------------
## ## global.R
## require(Lahman); require(plyr)
## dat = Teams[,c('yearID', 'name', 'G', 'SO')]
## team_data = na.omit(transform(dat, SOG = round(SO/G, 2)))
## league_data = ddply(team_data, .(yearID), summarize, SOG = mean(SOG))
## THRESHOLD = 30
## team_appearances = count(team_data, .(name))
## teams_in_menu = subset(team_appearances, freq > THRESHOLD)$name


