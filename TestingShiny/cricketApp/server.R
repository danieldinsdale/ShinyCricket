library(yorkr)
library(cricketr)
library(ggplot2)
library(dplyr)
library(magrittr)
source('cricketFunctions.R')
source('cricketData.R')

shinyServer(function(input, output) {
  
  teamData <- reactive({  
    scorecard <- teamBattingScorecardAllOppnAllMatches(get(findAbbrev(input$team1)),theTeam=input$team2)
    scorecard[is.na(scorecard)] <- 0
    # scorecard$strikeRate <- scorecard$runs/scorecard$ballsPlayed

    scorecard %<>% dplyr::mutate(strikeRate = runs / ballsPlayed)
    return(scorecard)
  })
  
  output$plot <- renderPlot({
    plotFnc(teamData(), input$statistic, input$sliderMinBalls)
  })
})


# shinyServer(function(input, output) {
#   output$plot <- renderPlot({
#     args = teamBattingScorecardAllOppnAllMatches(get(paste0(input$team1,"_Allmatches")),theTeam=input$team2)
#     plot(args$runs)
#   })
# })
# 


#apropos(strsplit("Rising Pune Supergiants", split=" ")[[1]])
