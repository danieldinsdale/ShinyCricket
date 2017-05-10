# this function takes the input name from the UI file and finds the abbreviation used
# to find the yorkr name
findAbbrev <- function(inputName){
  fullName <- strsplit(inputName, split=" ")[[1]]
  for(j in 1:length(fullName)){
    abbreviationName <- apropos(fullName[j])
    if(length(abbreviationName)>0) break
  }
  return(abbreviationName)
}

# this function takes the current data set and determines which statistic to plot
# data is the scoreboard input and stat is which statistic to return from that data
plotFnc <- function(data, stat){
   if(stat == "Runs") return(data$runs)
   if(stat == "Sixes") return(data$sixes)
   if(stat == "Fours") return(data$fours)
   if(stat == "Balls Played") return(data$ballsPlayed)
}

# this function plots data through ggplot2 ordering the batsmen by the statistic chosen
plotFncV2 <- function(data, stat){
  if(stat == "Runs"){
    data$batsman=reorder(data$batsman, data$runs)
    return(ggplot(data, aes(batsman, runs)) +  geom_point(size = 3) +  coord_flip())
  } #return(data$runs)
  if(stat == "Sixes"){
    data$batsman=reorder(data$batsman, data$sixes)
    return(ggplot(data, aes(batsman, sixes)) +  geom_point(size = 3) +  coord_flip())
  } #return(data$sixes)
  if(stat == "Fours"){
    data$batsman=reorder(data$batsman, data$fours)
    return(ggplot(data, aes(batsman, fours)) +  geom_point(size = 3) +  coord_flip())
  } #return(data$fours)
  if(stat == "Balls Played"){
    data$batsman=reorder(data$batsman, data$ballsPlayed)
    return(ggplot(data, aes(batsman, ballsPlayed)) +  geom_point(size = 3) +  coord_flip())
  } #return(data$ballsPlayed)
}
