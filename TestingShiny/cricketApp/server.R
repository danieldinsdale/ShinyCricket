library(yorkr)
library(cricketr)
library(ggplot2)
library(dplyr)
library(magrittr)
library(rvest)
library(shinydashboard)
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
  #code to plot team statistics
  output$plot <- renderPlot({
    plotFnc(teamData(), input$statistic, input$sliderMinBalls)
  })
  #code to plot bowler statistics given team and bowler name
  output$bowlerPlot <- renderPlot({
    bowlerStats <- getBowlerWicketDetails(team=input$bowlingTeam, name=input$bowlerSelect,
                                          dir=".")
    bowlingPlot <- bowlerMeanEconomyRate(bowlerStats, input$bowlerSelect)
    return(bowlingPlot)
  })
  #code to adapt UI with bowlers from selected IPL team
  output$bowlerSelection <- renderUI({
    team=input$bowlingTeam
    fl <- paste(".", "/", team, "-BowlingDetails.RData", sep = "")
    load(fl)
    uiNew <- as.character(unique(bowlingDetails$bowler))
    selectInput("bowlerSelect", 
                label = "Select a player",
                choices = uiNew)
  })
  #grabs player portrait URL from cricinfo
  bowlerImage <- reactive({
    return(playerImageURLFull(input$bowlerSelect))
  })
  #plots player portrait from URL in playerImage
  output$picture<-renderText({c('<img src="',bowlerImage(),'">')})
  
})

