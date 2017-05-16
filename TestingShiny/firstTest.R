library(shiny)
#runExample("01_hello")
#laptop
setwd("~/UBC/ShinyCricket/TestingShiny")
#PC
setwd("~/UBC/ShinyCricket/TestingShiny")
# run app normally
runApp("firstApp")
# run app with code visible
runApp("firstApp", display.mode = "showcase")
#
# lesson 5

library(maps)
library(mapproj)
source("census-app/helpers.R")
counties <- readRDS("census-app/data/counties.rds")
percent_map(counties$white, "darkgreen", "% White")

# lesson 6
runApp("stockVis", display.mode = "showcase")


# run cricket app
runApp("cricketApp", display.mode = "showcase")

runApp("cricketApp")
# deploy app

#library(rsconnect)
#deployApp('cricketApp')
