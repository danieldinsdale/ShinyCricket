library(yorkr)
library(cricketr)

Kohli <- getPlayerData(253802,dir="..",file="Kohli.csv",type="batting",homeOrAway=c(1,2),
                           result=c(1,2,4))
convertYaml2RDataframeT20("335982.yaml",".",".") 

setwd("C:/Users/Daniel/Downloads/yorkrData-master/yorkrData-master/IPL/IPL-T20-team-allMatches-allOppostions")
setwd("~/UBC/ShinyCricket/TestingShiny/cricketApp")
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

ggplot(m, aes(batsman, ballsPlayed)) +  geom_point(size = 3) +  coord_flip()
##
#
#
#
#
library(rvest)
url="http://www.espncricinfo.com/india/content/player/35320.html"
playerURL <- read_html(url)


linkNodes <- html_nodes(playerURL, "link")
imageColumn <- grep('image_src', linkNodes)
portraitURL <- unlist(html_attrs(linkNodes[imageColumn]))[[2]]          
#
#
#
#
#
library(XML)
library(RCurl)
getGoogleURL <- function(search.term, domain = '.co.uk', quotes=TRUE) 
{
  search.term <- gsub(' ', '%20', search.term)
  if(quotes) search.term <- paste('%22', search.term, '%22', sep='') 
  getGoogleURL <- paste('http://www.google', domain, '/search?q=',
                        search.term, sep='')
}
getGoogleLinks <- function(google.url) {
  doc <- getURL(google.url, httpheader = c("User-Agent" = "R
                                           (2.10.0)"))
  html <- htmlTreeParse(doc, useInternalNodes = TRUE, error=function
                        (...){})
  nodes <- getNodeSet(html, "//h3[@class='r']//a")
  return(sapply(nodes, function(x) x <- xmlAttrs(x)[["href"]]))
}

search.term <- "cran"
quotes <- "FALSE"
search.url <- getGoogleURL(search.term=search.term, quotes=quotes)

links <- getGoogleLinks(search.url)


library(URLencode)
library(rvest)

getWebsite <- function(name)
{
  url = URLencode(paste0("https://www.google.com/search?q=",name))
  
  page <- read_html(url)
  
  results <- page %>% 
    html_nodes("cite") %>% # Get all notes of type cite. You can change this to grab other node types.
    html_text()
  
  result <- results[1]
  
  return(as.character(result)) # Return results if you want to see them all.
}



findWebsite <- function(player){
  searchURL <- URLencode(paste0("https://www.google.com/search?q=",player))
  cricinfoPage <- read_html(searchURL)
  cricinfoURL <- html_text(html_nodes(cricinfoPage, "cite"))[1]
  return(cricinfoURL)
}



################################
setwd("C:/Users/Daniel/Downloads/yorkrData-master/yorkrData-master/IPL/IPL-T20-matches")
Chennai_batting <- getTeamBattingDetails("Chennai Super Kings",dir=".", save=TRUE)
Delhi_batting <- getTeamBattingDetails("Delhi Daredevils",dir=".",save=TRUE)
Kolkata_batting <- getTeamBattingDetails("Kolkata Knight Riders",dir=".",save=TRUE)
Mumbai_batting <- getTeamBattingDetails("Mumbai Indians",dir=".",save=TRUE)
Bangalore_batting <- getTeamBattingDetails("Royal Challengers Bangalore",dir=".",save=TRUE)

Deccan_batting <- getTeamBattingDetails("Deccan Chargers",dir=".",save=TRUE)
Hyderabad_batting <- getTeamBattingDetails("Sunrisers Hyderabad",dir=".",save=TRUE)
Punjab_batting <- getTeamBattingDetails("Kings XI Punjab",dir=".",save=TRUE)
Kochi_batting <- getTeamBattingDetails("Kochi Tuskers Kerala",dir=".",save=TRUE)
Rajasthan_batting <- getTeamBattingDetails("Rajasthan Royals",dir=".",save=TRUE)
Pune_batting <- getTeamBattingDetails("Pune Warriors",dir=".",save=TRUE)

#
Chennai_bowling <- getTeamBowlingDetails("Chennai Super Kings",dir=".", save=TRUE)
Delhi_bowling <- getTeamBowlingDetails("Delhi Daredevils",dir=".",save=TRUE)
Kolkata_bowling <- getTeamBowlingDetails("Kolkata Knight Riders",dir=".",save=TRUE)
Mumbai_bowling <- getTeamBowlingDetails("Mumbai Indians",dir=".",save=TRUE)
Bangalore_bowling <- getTeamBowlingDetails("Royal Challengers Bangalore",dir=".",save=TRUE)

Deccan_bowling <- getTeamBowlingDetails("Deccan Chargers",dir=".",save=TRUE)
Hyderabad_bowling <- getTeamBowlingDetails("Sunrisers Hyderabad",dir=".",save=TRUE)
Punjab_bowling <- getTeamBowlingDetails("Kings XI Punjab",dir=".",save=TRUE)
Kochi_bowling <- getTeamBowlingDetails("Kochi Tuskers Kerala",dir=".",save=TRUE)
Rajasthan_bowling <- getTeamBowlingDetails("Rajasthan Royals",dir=".",save=TRUE)
Pune_bowling <- getTeamBowlingDetails("Pune Warriors",dir=".",save=TRUE)


batsman = battingDetails = NULL
team="Delhi Daredevils"
fl <- paste(".", "/", team, "-BattingDetails.RData", sep = "")
load(fl)
uiNew <- unique(battingDetails$batsman)
i=61
getBatsmanDetails(team="Delhi Daredevils",name=uiNew[i],dir=".")




sehwag <-  getBatsmanDetails(team="Delhi Daredevils",name="V Sehwag",dir=".")
p1 <-batsmanRunsVsDeliveries(sehwag,"V Sehwag")
plot(p1)
sehwag46 <- select(sehwag,batsman,ballsPlayed,fours,sixes,runs)
p2 <-batsmanFoursSixes(sehwag46,"V Sehwag")
plot(p2)
p3 <-yorkr::batsmanDismissals(sehwag,"V Sehwag")
plot(p3)



NiceDismissals <- function (df, name) 
{
  batsman <- wicketKind <- dismissal <- NULL
  DismissalType <- NULL
  b <- select(df, batsman, wicketKind)
  c <- summarise(group_by(b, batsman, wicketKind), dismissal = n())
  d <- mutate(c, wicketKind = paste(wicketKind, "(", dismissal, 
                                    ")", sep = ""))
  names(d) <- c("batsman", "DismissalType", "dismissal")
  plot.title = paste(name, "- Dismissal Summary")
  pal = brewer.pal(7,"Set2") #scale_colour_brewer(palette = "Set2")
  ggplot(d, aes(x = DismissalType, y = dismissal, fill = DismissalType)) + 
    geom_bar(width = 1, stat = "identity") + #coord_polar("y", start = 0) + 
    ggtitle(bquote(atop(.(plot.title), atop(italic("Data source:http://cricsheet.org/"),"")))) +
    theme(plot.title = element_text(hjust = 0.5),
          axis.title.x=element_blank(),
          axis.text.x=element_blank(),
          axis.ticks.x=element_blank()) + 
    scale_fill_discrete(name = "Dismissal Type") +
    labs(y = "Number of Dismissals") +
    scale_fill_brewer(palette = "Set3")
}
p4 <- DannyDismissals(sehwag,"V Sehwag")
plot(p4)



harbhajan <-  getBowlerWicketDetails(team="Mumbai Indians",name="Harbhajan Singh",dir=".")

p4<-bowlerMeanEconomyRate(harbhajan, "Harbhajan Singh")
plot(p4)


unique(mi_bowling$bowler)
bowlerStats <- getBowlerWicketDetails(team="Mumbai Indians",name="SM Pollock",dir=".")
bowlingPlot <- bowlerMeanEconomyRate(bowlerStats, "SM Pollock")
plot(bowlingPlot)
