
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
  
# initBE()
