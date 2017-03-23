
library(ggplot2)
library(shiny)

curdf <- data.frame(x=1:10)
traceIt <- "pippo"
traceText <- reactive({traceIt})
values <- "dummy"


utlCmdMenu <- list('On Data Frame' = c("names", "nrow","ncol"),
                   'On "x" variable' = c("mean", "median"))


# smooth
plotParamConsts <- list(
  regrPlotSmooth = c("None","Lm","Loess")
  
)
setClass("plotParsClass",
  slots = c(regrSmoot = "character"
            , pointSize = "numeric")
)
plotPars = new("plotParsClass")


initBE <- function() {
  data("mtcars")
  values <<- reactiveValues()
  values$msg <<- "reactive value message"
  
  curdf <<- mtcars
}

setMsg <- function(m) { 
  values$msg <<- m; 
}
  
plotRegression <- function(xpar, ypar,dfra,plotPar) {
  p <- ggplot(data = dfra, aes(x=dfra[[xpar]],y=dfra[[ypar]]))
  p <- p + geom_point(size=plotPar@pointSize)

  if (plotPar@regrSmoot == "Lm")
      p <- p + geom_smooth(method='lm',formula=y~x)
  if (plotPar@regrSmoot == "Loess")
    p <- p + geom_smooth(method='loess',formula=y~x)
  
  p
}


performVariableCommand <- function(cmdPar, var) {
  cmd <- match.fun(cmdPar)
  setMsg(paste("running command:",cmdPar,"on",var))
  #setMsg(paste("command",cmdPar," var ",var))  
  return(cmd(mtcars[[var]]))
}


performDFCommand <- function(cmdPar, var) {
  cmd <- match.fun(cmdPar)
  # ret <- paste("running command:",cmdPar,"on mtcars data frame")
  ret <- cmd(mtcars)
  ret
}



