
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


  output$utlCmdOut <- renderText({
    utlCmd("dummyInput")})
   
  output$utlCmdChosen <- renderText({
    chosen <- input$utlCmdId;
    values$msg <<- paste("values$msg = ",chosen);
    return(chosen)
    })
  
  output$regrPlot <- renderPlot({
    plotRegression(mtcars$mpg, mtcars$cyl,mtcars);
  })
   # "trace" msgs
   output$traceOut <- renderText({values$msg})
})
