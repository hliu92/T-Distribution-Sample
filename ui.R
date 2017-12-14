library(shiny)

shinyUI(fluidPage(
  
  # Application title
  titlePanel("T Distribution with Different Degrees of Freedom"),
  
  # Sidebar: choose degree of freedom 
  sidebarLayout(
    sidebarPanel(
            h3("How to use this App"),
            h5("This App visualizes T Distribution with different degrees of freedom, and also calculates the P-value with different T statistics. 
               After selecting the degree of freedom and T Statistic on the left, you will see the plot and outcome on the right."),
            sliderInput("df",
                   "Choose Degree of Freedom",
                   min = 0.1,
                   max = 10,
                   value = 5,
                   step = 0.1),
            sliderInput("tstat",
                   "Choose T Statistic",
                   min = 0,
                   max = 4,
                   value = 2,
                   step = 0.1)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("distPlot"),
       textOutput("text")
    )
  )
))
