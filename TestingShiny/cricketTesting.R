library(yorkr)
library(cricketr)

Kohli <- getPlayerData(253802,dir="..",file="Kohli.csv",type="batting",homeOrAway=c(1,2),
                           result=c(1,2,4))
convertYaml2RDataframeT20("335982.yaml",".",".") 

setwd("C:/Users/Daniel/Downloads/yorkrData-master/yorkrData-master/IPL/IPL-T20-team-allMatches-allOppostions")
load("allMatchesAllOpposition-Chennai Super Kings.RData")
csk_Allmatches <- matches
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
mi_Allmatches <- matches
load("allMatchesAllOpposition-Pune Warriors.RData")
pw_Allmatches <- matches
load("allMatchesAllOpposition-Rajasthan Royals.RData")
rr_Allmatches <- matches
load("allMatchesAllOpposition-Royal Challengers Bangalore.RData")
rcb_Allmatches <- matches
load("allMatchesAllOpposition-Sunrisers Hyderabad.RData")
sh_Allmatches <- matches
load("allMatchesAllOpposition-Chennai Super Kings.RData")
CSK <- matches




m <-teamBattingScorecardAllOppnAllMatches(csk_Allmatches,theTeam="Chennai Super Kings")
m <-teamBattingScorecardAllOppnAllMatches(matches=csk_Allmatches,theTeam="Royal Challengers Bangalore")
plot(m$batsman,m$runs)


batTable$batsman=reorder(batTable$batsman, batTable$runs)
ggplot(batTable, aes(batsman, runs)) +
  geom_point(size = 3) + 
  coord_flip()
