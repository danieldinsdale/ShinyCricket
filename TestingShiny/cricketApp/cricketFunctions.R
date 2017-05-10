
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
   if(stat == "runs") return(data$runs)
   if(stat == "sixes") return(data$sixes)
   if(stat == "fours") return(data$fours)
   if(stat == "ballsPlayed") return(data$ballsPlayed)
}

