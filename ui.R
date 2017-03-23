
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

source("backend.R")

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Simple Plot mtcars"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(

    selectInput("yVar", "Choose Y Variable:",
      names(mtcars), selected = 1
    )
    
    ,selectInput("xVar", "Choose X Variable:",
        names(mtcars)
      ,selected = names(mtcars)[length(names(mtcars))]
    )
    
    ,radioButtons("regrLine", "Regression Smoothing",
                  plotParamConsts$regrPlotSmooth,
                  selected = "Loess"
    )
    ,    sliderInput("pointSize",
                     "Size of points in plot:",
                     min = 1,
                     max = 8,
                     value = 2)
    
    ,hr()
    ,selectInput("utlCmdId", "Choose a command:",
                 utlCmdMenu
        # list('explore' = c("str", "names", "nrow"),
        # 'Summaries' = c("summary", "mean", "median")
      )
    ) # sidebar panel
    # Show a plot of the generated distribution
  ,mainPanel(
       plotOutput("regrPlot")
      ,textOutput("utlCmdOut")
      ,textOutput("utlCmdChosen")
      ,textOutput("globalStatus")
      ,textOutput("traceOut")
  )
  )
))
