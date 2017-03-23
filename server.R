
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
  
  
  output$globalStatus <- renderText({
    status <- paste(
      "y var:",input$yVar
      ,"x var:",input$xVar
    ,sep="");
    return(status)
  })
  
  
  # trace msg 
  output$utlCmdChosen <- renderText({
    chosen <- input$utlCmdId;
    values$msg <<- paste("latest msg = ",chosen);
    return(chosen)
    })

  
  
    
  
  
  output$regrPlot <- renderPlot({
    plotRegression(input$xVar,input$yVar,mtcars);
  })
   # "trace" msgs
   output$traceOut <- renderText({values$msg})
})
