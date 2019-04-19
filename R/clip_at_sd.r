#' Clip a vector at certain number of standard deviations from the mean, setting more extreme values to bound
#' 
#' Takes a numeric vector and limits its range to be within certain number of standard deviations.
#' @param v numeric array
#' @return array of same length
#' @export
#' @examples 
#' ClipAtSd(iris$Sepal.Length)
ClipAtSd <- function(v, clip.at.sd = 3) {
    if (all(is.na(v))) return(v)  # return vector of NA if all are NA
    if (!is.numeric(v)) return(v)  # return original values if not numeric
    v.sd = sd(v, na.rm=TRUE)
    v.mean = mean(v, na.rm=TRUE)
    return(peterr::Clip(v, v.mean-clip.at.sd*v.sd, v.mean+clip.at.sd*v.sd))
}