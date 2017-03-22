
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

source("backend.R")

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Old Faithful Geyser Data"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(

    sliderInput("bins",
        "Number of bins:",
        min = 1,
        max = 50,
        value = 30)

    ,selectInput("utlCmdId", "Choose a command:",
        list('explore' = c("str", "names", "nrow"),
        'Summaries' = c("summary", "mean", "median")
      ))
    ) # sidebar panel
    # Show a plot of the generated distribution
  ,mainPanel(
      plotOutput("distPlot")
      ,textOutput("utlCmdOut")
      ,textOutput("utlCmdChosen")
      ,textOutput("traceOut")
  )
  )
))
