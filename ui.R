
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

source("backend.R")

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Stats and Plot on mtcars"),

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
    ,sliderInput("pointSize",
      "Size of points in plot:"
      ,min = 1, max = 8,value = 2)
    
    ,hr()
    ,selectInput("utlCmdId", "Choose a Statistic:",utlCmdMenu,
                 selected = "median")
    ) # sidebar panel
    # Show a plot of the generated distribution
  ,mainPanel(
       h3(strong("Documentation")
          ,tags$a(href="https://enrico200165.shinyapps.io/appdocumentation/"
            ,"here",style="color:blue;"),style="color:red"
       )
       ,hr()
      ,plotOutput("regrPlot")
      ,h3("Stat functions output",style="color:blue")
      ,textOutput("utlCmdOut")
      ,textOutput("utlCmdChosen")
      ,hr()
      ,h3("AppStatus",style="color:blue")
      ,textOutput("globalStatus")
      ,hr()
      ,h3("Debug messages",style="color:blue")
      ,textOutput("traceOut")
  )
  )
))
