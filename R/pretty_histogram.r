#' Generate a subjectively pretty ggplot histogram
#' 
#' Uses a set of defaults that I like to generate a histogram of either a numeric or factor
#' @param v array with data that goes into histogram
#' @param force.factor logical, convert input to factor so you ensure a percentage for each level
#' @param sort.factor should factor be reordered so it goes from most to least common?
#' @param ... any additional argument passed on to \code{\link{ggplot2::labs}} such as title, xlab, ylab.
#' @return ggplot object
#' @seealso \code{\link{ggplot2::geom_histogram}} which this function wraps
#' @export
#' @examples 
#' PrettyHistogram(iris$Sepal.Length)
#' PrettyHistogram(iris$Species)
PrettyHistogram <- function(v, force.factor=FALSE, sort.factor=TRUE, ...) {
    if (sum(!is.na(v)) < 1) {
        warning('No values to plot, all missing')
        return(ggplot2::ggplot())
    }
    if (is.data.frame(v)) {
        warning('Should give an array, not dataframe, to PrettyHistogram(). Taking first column')
        v = v[, 1]
    }
    # if character vector is given, force to factor
    if (is.character(v)) force.factor=TRUE

    # if requested, force the array into a factor
    if (force.factor & !is.factor(v)) v = factor(v)

    # if requested, sort the factor levels from most to least frequent
    if (is.factor(v) & sort.factor) v = forcats::fct_infreq(v)

    # put array into dataframe
    v = data.frame(plotvar = v)
    g = ggplot2::ggplot(v, ggplot2::aes(plotvar)) + 
        ggplot2::labs(...) +
        ggplot2::theme_minimal()
    
    if (is.factor(v$plotvar)) {        
        g = g + 
            ggplot2::geom_bar(ggplot2::aes(y = (..count..)/sum(..count..))) + 
            ggplot2::scale_y_continuous(labels = scales::percent) + 
            ggplot2::theme(axis.title = ggplot2::element_blank())
    } else {
        g = g + 
            ggplot2::geom_histogram(bins=30)
    }
    
    return(g)
}
