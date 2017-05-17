library(shiny)

dashboardPage(
  dashboardHeader(title = div("IPL Statistics")),  
  dashboardSidebar(
    sidebarMenu(
      menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
      menuItem("Player Statistics", tabName = "players", icon = icon("th"))
    )
  ),
  dashboardBody(
    tabItems(
      # First tab content
      tabItem(tabName = "dashboard",
              fluidPage(
                titlePanel(title=div(img(src="IPLLogo.jpg", width=100))),
                fluidRow(
                  column(4, wellPanel(
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
                                choices = c("Runs", "Strike Rate", "Sixes", "Fours", "Balls Played"),
                                selected = "Runs"),
                    sliderInput("sliderMinBalls", label = h3("Minimum Balls Faced"),
                                min = 0, max = 100, value = 0)
                  )),
                  column(4,
                         mainPanel(plotOutput("plot", width = 600)),
                         mainPanel(plotOutput("teamLogo", width = 20))
                  )
                )
              )
      ),
      tabItem(tabName = "players",
              fluidRow(
                column(4,
                       #mainPanel(plotOutput("plot", width = 600)),
                       #mainPanel(plotOutput("teamLogo", width = 20)),
                       textInput("cricketPortrait", "Random Cricket Player", value = "Tim Bresnan", width = NULL, placeholder = NULL),
                       htmlOutput("picture")
                )
              )
      )
    )
  )
)
