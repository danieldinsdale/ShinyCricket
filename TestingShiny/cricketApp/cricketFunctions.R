# this function takes the input name from the UI file and finds the abbreviation used
# to find the yorkr name
findAbbrev <- function(inputName){
  fullName <- unlist(strsplit(inputName, split=" "))
  for(j in 1:length(fullName)){
    abbreviationName <- apropos(fullName[j])
    if(length(abbreviationName)>0) break
  }
  return(abbreviationName)
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