
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

source("backend.R")

library(shiny)


initBE()
setMsg("BE init complete")


shinyServer(function(input, output) {

  output$distPlot <- renderPlot({
    # generate bins based on input$bins from ui.R
    x    <- faithful[, 2]
    bins <- seq(min(x), max(x), length.out = input$bins + 1)

    # draw the histogram with the specified number of bins
    hist(x, breaks = bins, col = 'darkgray', border = 'white')
  })
  
  output$utlCmdOut <- renderText({
    utlCmd("dummyInput")})
   
  output$utlCmdChosen <- renderText({
    chosen <- input$utlCmdId;
    values$msg <<- paste("values$msg = ",chosen);
    return(chosen)
    })
  
   output$traceOut <- renderText({values$msg})
})
