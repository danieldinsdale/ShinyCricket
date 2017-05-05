library(yorkr)
library(cricketr)

setwd("C:/Users/Daniel/Downloads/yorkrData-master/yorkrData-master/IPL/IPL-T20-team-allMatches-allOppostions")

load("allMatchesAllOpposition-Deccan Chargers.RData")
dc_Allmatches <- matches
load("allMatchesAllOpposition-Delhi Daredevils.RData")
dd_Allmatches <- matches
load("allMatchesAllOpposition-Kings XI Punjab.RData")
kxip_Allmatches <- matches
load("allMatchesAllOpposition-Kochi Tuskers Kerala.RData")
ktk_Allmatches <- matches
load("allMatchesAllOpposition-Kolkata Knight Riders.RData")
kkr_Allmatches <- matches
load("allMatchesAllOpposition-Mumbai Indians.RData")
Mumbai_Allmatches <- matches
load("allMatchesAllOpposition-Pune Warriors.RData")
Pune_Allmatches <- matches
load("allMatchesAllOpposition-Rajasthan Royals.RData")
rr_Allmatches <- matches
load("allMatchesAllOpposition-Royal Challengers Bangalore.RData")
rcb_Allmatches <- matches
load("allMatchesAllOpposition-Hyderabad.RData")
sh_Allmatches <- matches
load("allMatchesAllOpposition-Chennai.RData")
csk_Allmatches <- matches

shinyServer(function(input, output) {
  output$plot <- renderPlot({
    # if(input$team == "Pune"){
    #   teamStats <- teamBattingScorecardAllOppnAllMatches(pw_Allmatches,theTeam="Chennai Super Kings")
    # }  else{
    #   teamStats <- teamBattingScorecardAllOppnAllMatches(mi_Allmatches,theTeam="Chennai Super Kings")
    # }
    
    args <- switch(input$team1,
                   "Mumbai" = teamBattingScorecardAllOppnAllMatches(Mumbai_Allmatches,theTeam=input$team2),
                   "Pune" = teamBattingScorecardAllOppnAllMatches(Pune_Allmatches,theTeam=input$team2))
    plot(args$runs)
  })
})