#' Clip a vector to lower and higher bound, setting more extreme values to bound
#' 
#' Takes a numeric vector and limits its range to be within two bounds.  values are maintained but set to bound.
#' @param v numeric array
#' @return array of same length
#' @export
#' @examples 
#' Clip(iris$Sepal.Length, 5, 6)
Clip <- function(v, lower=-Inf, upper=Inf) {
    if (!is.numeric(v)) return(v)
    return(pmax(lower, pmin(v, upper)))
}