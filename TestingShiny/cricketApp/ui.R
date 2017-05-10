library(shiny)

shinyUI(fluidPage(
  titlePanel("IPL Statistics"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput("team1", 
                  label = "Select an IPL team to analyse",
                  choices = c("Deccan Chargers", "Delhi Daredevils", "Kings XI Punjab", "Kochi Tuskers Kerala", "Kolkata Knight Riders", 
                              "Rajasthan Royals", "Royal Challengers Bangalore", "Sunrisers Hyderabad", "Chennai Super Kings", 
                              "Mumbai Indians", "Pune Warriors"),
                  selected = "Mumbai Indians"),
      selectInput("team2", 
                  label = "Select an opposition IPL team (leave blank if all teams)",
                  choices = c("Deccan Chargers", "Delhi Daredevils", "Kings XI Punjab", "Kochi Tuskers Kerala", "Kolkata Knight Riders", 
                              "Rajasthan Royals", "Royal Challengers Bangalore", "Sunrisers Hyderabad", "Chennai Super Kings", 
                              "Mumbai Indians", "Pune Warriors"),
                  selected = "Royal Challengers Bangalore"),
      selectInput("statistic", 
                  label = "Select a statistic",
                  choices = c("runs", "sixes", "fours", "ballsPlayed"),
                  selected = "runs"),
      br(),
      br(),
      
      checkboxInput("log", "Plot y axis on log scale", 
                    value = FALSE),
      
      checkboxInput("adjust", 
                    "Adjust prices for inflation", value = FALSE)
    ),
    
    mainPanel(plotOutput("plot"))
  )
))

