
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

  output$globalStatus <- renderText({
    status <- paste("Status info: "
      ,"y var:",input$yVar
      ," ","x var:",input$xVar
    ,sep="");
    return(status)
  })
  
  
  # Utility command 
  output$utlCmdChosen <- renderText({

    ret <- paste("performing command:",input$utlCmdId)

        if (input$utlCmdId %in% unlist(utlCmdMenu['On Data Frame'])) {
      cmd_out <- performDFCommand(input$utlCmdId,input$xVar)
    } else if(input$utlCmdId %in% unlist(utlCmdMenu['On "x" variable'])) {
      ret <- paste(ret,"on variable:",input$xVar)
      cmd_out <- performVariableCommand(input$utlCmdId,input$xVar)
    } else {
      cmd_out <- "unable to perform command"    
    }
    cmd_out <- paste(cmd_out,sep = " ", collapse = " ")
    ret <- paste(ret,"raw output: ",cmd_out, sep = " ", collapse = " ")
      return(ret)
    })


  output$regrPlot <- renderPlot({
    plotPars@regrSmoot <- input$regrLine
    plotPars@pointSize <- input$pointSize
    plotRegression(input$xVar,input$yVar,mtcars,
                   plotPars);
  })

  
     # "trace" msgs
   output$traceOut <- renderText({values$msg})
})
