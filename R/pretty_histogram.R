#' Generate a subjectively pretty ggplot histogram
#' 
#' Uses a set of defaults that I like to generate a histogram
#' @param v array with data that goes into histogram
#' @param ... any additional argument passed on to \code{\link{ggplot2::labs}} such as title, xlab, ylab.
#' @return ggplot object
#' @seealso \code{\link{ggplot2::geom_histogram}} which this function wraps
#' @export
#' @examples 
#' pretty_histogram(iris$Sepal.Length)
pretty_histogram <- function(v, ...) {
    if (sum(!is.na(v)) < 1) {
        warning('No values to plot, all missing')
        return(ggplot2::ggplot())
    }
    if (is.data.frame(v)) {
        warning('Should give an array, not dataframe, to pretty_histogram(). Taking first column')
        v = v[, 1]
    }
    v = data.frame(plotvar = v)

    g = ggplot2::ggplot(v, ggplot2::aes(plotvar)) + 
        ggplot2::geom_histogram(bins=30) +
        ggplot2::labs(...) +
        ggplot2::theme_minimal()

    return(g)
}
