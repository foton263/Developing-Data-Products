library(shiny)

# Define UI 
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Stock Prediction"),
  
  # Sidebar with controls
  sidebarPanel(
    
    textInput("symb",label=h3("Stock Symbol"), value = "^NDX"),
    dateRangeInput("dates", label=h3("Date range"), max = (Sys.Date()-1),end = (Sys.Date()-1),start = "2012-01-01"),
    numericInput("ahead", label=h3("Days to forecast ahead:"), 30),
    submitButton("Update View")
    
  ),
  
  # Main Panel with tabs for different plots
  mainPanel(
    tabsetPanel(
      tabPanel("Documentation", h4(textOutput("docMainTitle")), htmlOutput("docMainText"),
               h4(textOutput("docInputsTitle")), htmlOutput("docInputsText"),
               h4(textOutput("docViewsTitle")), htmlOutput("docViewsText")),
      tabPanel("Historical Plot", plotOutput("plot")), 
      tabPanel("Forecast Plot", plotOutput("plot2")),
      tabPanel("Timeseries Decomposition", plotOutput("plot3"))
    )
  )
))