
library(ggplot2)
library(shiny)

curdf <- data.frame(x=1:10)
traceIt <- "pippo"
traceText <- reactive({traceIt})
values <- "dummy"

initBE <- function() {
  data("mtcars")
  values <<- reactiveValues()
  values$msg <<- "reactive value message"
  
  curdf <<- mtcars
}

utlCmd <- function(cmdPar) {
  return("dummy utl command output from backend")
}


# getMsg <- function() {
#   return(traceText());
# }

setMsg <- function(m) { 
  values$msg <<- m; 
}
  
plotRegression <- function(xpar, ypar,dfra) {
  # hist(sample(100:110,100, replace = T),col = 'darkgray', border = 'white')
  p <- ggplot(data = dfra, aes(x=xpar,y=ypar))
  p <- p + geom_point(size=4)
  p
}

fitModel <- function(resp_v, regr_v,dfra) {
  fit <- lm(response ~ regressor)
}

