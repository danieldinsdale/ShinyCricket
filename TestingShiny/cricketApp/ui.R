library(shiny)
library(shinydashboard)

dashboardPage(
  dashboardHeader(title = div("IPL Statistics")),  
  dashboardSidebar(
    sidebarMenu(
      menuItem("Team Analysis", tabName = "teamAnalysis", icon = icon("bar-chart")),
      menuItem("Bowling Analysis", tabName = "bowlingAnalysis", icon = icon("bar-chart")),
      menuItem("Batting Analysis", tabName = "batsmanAnalysis", icon = icon("bar-chart")),
      menuItem("Special Thanks", tabName = "specialThanks", icon = icon("bullhorn"))
      
    )
  ),
  dashboardBody(
    tabItems(
      # First tab content
      tabItem(tabName = "teamAnalysis",
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
      tabItem(tabName = "bowlingAnalysis",
              titlePanel(title=div(img(src="IPLLogo.jpg", width=100))),
              fluidRow(
                column(4,wellPanel( 
                       selectInput("bowlingTeam", 
                                   label = "Select an IPL team to analyse",
                                   choices = c("Deccan Chargers", "Delhi Daredevils", "Kings XI Punjab", "Kochi Tuskers Kerala", "Kolkata Knight Riders", 
                                               "Rajasthan Royals", "Royal Challengers Bangalore", "Sunrisers Hyderabad", "Chennai Super Kings", 
                                               "Mumbai Indians", "Pune Warriors"),
                                   selected = "Mumbai Indians"),
                       uiOutput("bowlerSelection"),
                       selectInput("bowlerInfo", 
                                   label = "Choose an analysis type",
                                   choices = c("Economy Rate", "Wickets vs Opposition", "Venue Record"),
                                   selected = "Economy Rate")
                ),
                column(4,
                       htmlOutput("bowlerPicture")
              )),
              column(4,
                     mainPanel(plotOutput("bowlerPlot", width = 600))
          )
      )),
      tabItem(tabName = "batsmanAnalysis",
              titlePanel(title=div(img(src="IPLLogo.jpg", width=100))),
              fluidRow(
                column(4, wellPanel(
                       selectInput("batsmanTeam", 
                                   label = "Select an IPL team to analyse",
                                   choices = c("Deccan Chargers", "Delhi Daredevils", "Kings XI Punjab", "Kochi Tuskers Kerala", "Kolkata Knight Riders", 
                                               "Rajasthan Royals", "Royal Challengers Bangalore", "Sunrisers Hyderabad", "Chennai Super Kings", 
                                               "Mumbai Indians", "Pune Warriors"),
                                   selected = "Delhi Daredevils"),
                       uiOutput("batsmanSelection"),
                       selectInput("batsmanInfo", 
                                   label = "Choose an analysis type",
                                   choices = c("Dismissal Type", "Runs vs Deliveries", "Opposition Record", "Venue Record"),
                                   selected = "Dismissal Type")
              ),
              column(4,
                     htmlOutput("batsmanPicture")
              )),
              column(4,
                     mainPanel(plotOutput("batsmanPlot", width = 600))
              )
         )
      ),
      tabItem(tabName = "specialThanks",
              titlePanel(title=div(img(src="IPLLogo.jpg", width=100))),
              fluidRow(
                column(7, 
                  h1("A special thanks to:"),
                  p("The R package", span(a("yorkr", href="https://cran.r-project.org/web/packages/yorkr/README.html")), "for data extraction and plotting code."),                
                  p(span(a("Cricinfo", href="http://www.espncricinfo.com")), "for player portraits."),
                  p(span(a("Cricsheet", href="http://cricsheet.org/"), "for the game data."))                
                  )
              )
      )
    )
  )
)
