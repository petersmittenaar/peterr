#' Write object to clipboard (e.g. dataframe)
#' 
#' Write a dataframe or any other object to your clipboard, ready to paste into a spreadsheet or presentation. Not sure if this works anywhere other than Linux.
#' @param x the object to copy to clipboard, usually a dataframe
#' @param ... any additional argument passed on to \code{\link{write.table}}
#' @return TRUE if successful, FALSE if xclip is not available on your system.
#' @seealso \code{\link{write.table}} which this function wraps
#' @export
#' @examples 
#' WriteXclip(iris)
WriteXclip <- function(x, ...) {
  if (!isTRUE(file.exists(Sys.which("xclip")[1L]))) {
    warning("Cannot find xclip. Install if on linux, or do not use this function if on other OS")
    return(FALSE)
  }
    
  con <- pipe("xclip -i -selection clipboard", "w")
  on.exit(close(con))
  write.table(x, con, row.names = FALSE, ...)
  return(TRUE)
}
