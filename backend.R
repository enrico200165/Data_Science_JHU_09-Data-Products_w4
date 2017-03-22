

curdf <- data.frame(x=1:10)


init <- function() {
  data("mtcars")
  curdf <- mtcars
}

utlCmd <- function(cmdPar) {
  return("dummy utl command output from backend")
}


init()
