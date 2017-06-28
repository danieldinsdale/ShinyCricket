# this function takes the input name from the UI file and finds the abbreviation used
# to find the yorkr name. Dataset is either  
# 1=AllMatches, 2=Batting, 3

findAbbrev <- function(inputName, dataset){
  fullName <- unlist(strsplit(inputName, split=" "))
  for(j in 1:length(fullName)){
    abbreviationName <- apropos(fullName[j])
    if(length(abbreviationName)>0) break
  }
  return(abbreviationName[[dataset]])
}

# this function plots data through ggplot2 ordering the batsmen by the statistic chosen
plotFnc <- function(data, stat, minBalls){
  data %<>% dplyr::filter(ballsPlayed >= minBalls)
  if(stat == "Runs"){
    data$batsman=reorder(data$batsman, data$runs)
    return(ggplot(data, aes(batsman, runs)) +  geom_point(size = 3) +  
             ylab(stat) + xlab("Batsman") + coord_flip())
  } else if(stat == "Strike Rate"){
    data$batsman=reorder(data$batsman, data$strikeRate)
    return(ggplot(data, aes(batsman, strikeRate)) +  geom_point(size = 3) +  
             ylab(stat) + xlab("Batsman") + coord_flip())
  } else if(stat == "Sixes"){
    data$batsman=reorder(data$batsman, data$sixes)
    return(ggplot(data, aes(batsman, sixes)) +  geom_point(size = 3) + 
             ylab(stat) + xlab("Batsman") + coord_flip())
  } else if(stat == "Fours"){
    data$batsman=reorder(data$batsman, data$fours)
    return(ggplot(data, aes(batsman, fours)) +  geom_point(size = 3) +  
             ylab(stat) + xlab("Batsman") + coord_flip())
  } else if(stat == "Balls Played"){
    data$batsman=reorder(data$batsman, data$ballsPlayed)
    return(ggplot(data, aes(batsman, ballsPlayed)) +  geom_point(size = 3) +  
             ylab(stat) + xlab("Batsman") + coord_flip())
  } 
}
# this function takes the image UI file and finds the file name used
findImage <- function(inputName){
  fullName <- unlist(strsplit(inputName, split=" "))
  for(j in 1:length(fullName)){
    abbreviationName <- list.files(path = "www/", pattern = fullName[j], full.names = T)
    if(length(abbreviationName)>0) break
  }
  return(abbreviationName)
}

# this function finds the URL of player portrait give the cricinfo players' URL
portraitURL <- function(urlWeb){
  playerURL <- read_html(urlWeb)
  linkNodes <- html_nodes(playerURL, "link")
  imageColumn <- grep('image_src', linkNodes)
  portrait <- unlist(html_attrs(linkNodes[imageColumn]))[[2]] 
  return(portrait)
}
# finds cricinfo page URL for player input
findWebsite <- function(player){
  playerName <- paste(player, "cricinfo")
  searchURL <- URLencode(paste0("https://www.google.com/search?q=",playerName))
  cricinfoPage <- read_html(searchURL)
  cricinfoURL <- paste("http://",html_text(html_nodes(cricinfoPage, "cite"))[1], sep="")
  return(cricinfoURL)
} 
# combines the cricinfo URL and image URL search. Finds image URL 
playerImageURLFull <- function(player){
  cricinfoURL <- findWebsite(player)
  finalURL <- portraitURL(cricinfoURL)
  return(finalURL)
}
# new version of function batsmanDismissals with nicer colours and layout
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
# function to select batsman analysis method
batsmanPlotFnc <- function(batsmanStats, player, plotType){
  if(plotType=="Dismissal Type"){
    output <- NiceDismissals(batsmanStats, player)
  }else{
    if(plotType=="Runs vs Deliveries"){
      output <- yorkr::batsmanRunsVsDeliveries(batsmanStats, player)
    }else{
      # if(plotType=="Boundary Analysis"){
      #   output <- batsmanFoursSixes(batsmanStats, player)
      # }else{}
    }
  }
  return(output)
}