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
csk_batting <- getTeamBattingDetails("Chennai Super Kings",dir=".", save=TRUE)
dd_batting <- getTeamBattingDetails("Delhi Daredevils",dir=".",save=TRUE)
kkr_batting <- getTeamBattingDetails("Kolkata Knight Riders",dir=".",save=TRUE)
mi_batting <- getTeamBattingDetails("Mumbai Indians",dir=".",save=TRUE)
rcb_batting <- getTeamBattingDetails("Royal Challengers Bangalore",dir=".",save=TRUE)

csk_bowling <- getTeamBowlingDetails("Chennai Super Kings",dir=".", save=TRUE)
dd_bowling <- getTeamBowlingDetails("Delhi Daredevils",dir=".",save=TRUE)
kkr_bowling <- getTeamBowlingDetails("Kolkata Knight Riders",dir=".",save=TRUE)
mi_bowling <- getTeamBowlingDetails("Mumbai Indians",dir=".",save=TRUE)
rcb_bowling <- getTeamBowlingDetails("Royal Challengers Bangalore",dir=".",save=TRUE)

sehwag <-  getBatsmanDetails(team="Delhi Daredevils",name="V Sehwag",dir=".")
p1 <-batsmanRunsVsDeliveries(sehwag,"V Sehwag")
plot(p1)
sehwag46 <- select(sehwag,batsman,ballsPlayed,fours,sixes,runs)
p2 <-batsmanFoursSixes(sehwag46,"V Sehwag")
plot(p2)
p3 <-yorkr::batsmanDismissals(sehwag,"V Sehwag")
plot(p3)

harbhajan <-  getBowlerWicketDetails(team="Mumbai Indians",name="Harbhajan Singh",dir=".")

p4<-bowlerMeanEconomyRate(harbhajan, "Harbhajan Singh")
plot(p4)
