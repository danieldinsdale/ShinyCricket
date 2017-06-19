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
