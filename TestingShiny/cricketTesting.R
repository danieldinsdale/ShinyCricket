library(yorkr)
library(cricketr)

Kohli <- getPlayerData(253802,dir="..",file="Kohli.csv",type="batting",homeOrAway=c(1,2),
                           result=c(1,2,4))
convertYaml2RDataframeT20("335982.yaml",".",".") 

setwd("C:/Users/Daniel/Downloads/yorkrData-master/yorkrData-master/IPL/IPL-T20-team-allMatches-allOppostions")
matches <-getAllMatchesAllOpposition("Royal Challengers Bangalore",dir=".",save=TRUE)
dim(matches)


load("allMatchesAllOpposition-Chennai Super Kings.RData")
csk_Allmatches <- matches
m <-teamBattingScorecardAllOppnAllMatches(csk_Allmatches,theTeam="Chennai Super Kings")
m <-teamBattingScorecardAllOppnAllMatches(matches=csk_Allmatches,theTeam="Royal Challengers Bangalore")
