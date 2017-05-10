library(yorkr)
library(cricketr)
library(ggplot2)
source('cricketFunctions.R')
source('cricketData.R')

shinyServer(function(input, output) {
  
  teamData <- reactive({  
    teamBattingScorecardAllOppnAllMatches(get(findAbbrev(input$team1)),theTeam=input$team2)
  })
  
  output$plot <- renderPlot({
    plotFncV2(teamData(), input$statistic)
    #plot(plotFnc(teamData(), input$statistic))
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
