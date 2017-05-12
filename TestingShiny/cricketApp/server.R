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
  # output$teamLogo <- renderPlot({
  #   img(src="Mumbai.png", width=100)
  #   #plot(4,5)
  # })
  
  
  output$teamLogo <- renderImage({
    if (input$team1 == "Mumbai Indians") {
      return(list(
        src = "www/Mumbai.png",
        contentType = "image/png",
        width = 100,
        #height = 100,
        alt = "Mumbai"
      ))
    } else{
      return(list(
        src = "www/RajasthanLogo.svg",
        filetype = "image/svg",
        width = 100,
        alt = "Not Mumbai"
      ))
    }
    
  }, deleteFile = FALSE)
  output$plot <- renderPlot({
    plotFnc(teamData(), input$statistic, input$sliderMinBalls)
  })
})

