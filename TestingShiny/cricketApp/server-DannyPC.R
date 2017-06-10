library(yorkr)
library(cricketr)
library(ggplot2)
library(dplyr)
library(magrittr)
library(rvest)
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
  team1Logo <- reactive({
    return(findImage(input$team1))
  })
  playerImage <- reactive({
    return(playerImageURLFull(input$cricketPortrait))
  })
  # rendering
  output$teamLogo <- renderImage({
    return(list(
      src = team1Logo(),
      contentType = "image/png",
      width = 100,
      #height = 100,
      alt = "Mumbai"
    ))
  }, deleteFile = FALSE)
  # random player logo
  output$picture<-renderText({c('<img src="',playerImage(),'">')})
  
  output$plot <- renderPlot({
    plotFnc(teamData(), input$statistic, input$sliderMinBalls)
  })
})

