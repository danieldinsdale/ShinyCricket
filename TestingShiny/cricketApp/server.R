library(yorkr)
library(cricketr)

setwd("C:/Users/Daniel/Downloads/yorkrData-master/yorkrData-master/IPL/IPL-T20-team-allMatches-allOppostions")

load("allMatchesAllOpposition-Deccan.RData")
Deccan_Allmatches <- matches
load("allMatchesAllOpposition-Delhi.RData")
Delhi_Allmatches <- matches
load("allMatchesAllOpposition-Punjab.RData")
Punjab_Allmatches <- matches
load("allMatchesAllOpposition-Kochi.RData")
Kochi_Allmatches <- matches
load("allMatchesAllOpposition-Kolkata.RData")
Kolkata_Allmatches <- matches
load("allMatchesAllOpposition-Mumbai.RData")
Mumbai_Allmatches <- matches
load("allMatchesAllOpposition-Pune.RData")
Pune_Allmatches <- matches
load("allMatchesAllOpposition-Rajasthan.RData")
Rajasthan_Allmatches <- matches
load("allMatchesAllOpposition-Bangalore.RData")
Bangalore_Allmatches <- matches
load("allMatchesAllOpposition-Hyderabad.RData")
Hyderabad_Allmatches <- matches
load("allMatchesAllOpposition-Chennai.RData")
Chennai_Allmatches <- matches

shinyServer(function(input, output) {
  output$plot <- renderPlot({
    args = teamBattingScorecardAllOppnAllMatches(get(paste0(input$team1,"_Allmatches")),theTeam=input$team2)
    plot(args$runs)
  })
})
