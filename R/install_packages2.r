#' Install a package if necessary and load
#' 
#' @param pckg.names string or vector of strings containing name(s) of the packages
#' @param also.load boolean on whether to load the package
#' @export
#' @examples 
#' install.packages2(c('tidyverse', 'mclust'))
install.packages2 <- function(pckg.names, also.load=TRUE) {
  for (i in seq_along(pckg.names)) {
    if (!require(pckg.names[i], character.only = TRUE)) install.packages(pckg.names[i])
    if (also.load) library(pckg.names[i], character.only = TRUE)
  }  
}