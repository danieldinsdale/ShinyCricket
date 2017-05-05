library(shiny)

shinyUI(fluidPage(
  titlePanel("IPL Statistics"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput("team1", 
                  label = "Select an IPL team to analyse",
                  choices = c("Mumbai", "Pune"),
                  selected = "Mumbai"),
      selectInput("team2", 
                  label = "Select an opposition IPL team (leave blank if all teams)",
                  choices = c("Chennai Super Kings", "Rajasthan Royals"),
                  selected = "Chennai Super Kings"),
      
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