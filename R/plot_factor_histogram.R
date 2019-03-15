#' Plot a histogram with factor frequencies
#' 
#' Pass a factor and get a ggplot histogram of the frequency of each factor level. If no factor is passed, the data are converted to factor.
#' If the factor has more than \code{max.levels} levels, abandon ship and return empty ggplot object.
#' @param v factor or other array to plot
#' @param max.levels if factor has more than this number of levels, return empty ggplot object
#' @return ggplot object
#' @seealso \code{\link{geom_bar}} which this function wraps
#' @export
#' @examples 
#' plot_factor_histogram(iris$Species)
#' plot_factor_histogram(iris$Sepal.Length, max.levels=40)
plot_factor_histogram = function(v, max.levels=30) {
    if (!is.factor(v)) v = factor(v)
    if (nlevels(v) > max.levels | nlevels(v) == 0) {
        warning(paste0('The factor you are plotting has ', nlevels(v), ' levels. You might have to set max.levels manually. Aborting...'))
        return(ggplot2::ggplot() + ggplot2::theme_minimal())
    }
    if (length(v) == 0) {
        warning('Length of vector to plot is 0; aborting')
        return(ggplot2::ggplot() + ggplot2::theme_minimal())
    }
    df = tibble::tibble(v=v)
    g = ggplot2::ggplot(df, ggplot2::aes(v)) + 
        ggplot2::geom_bar(ggplot2::aes(y = (..count..)/sum(..count..))) + 
        ggplot2::scale_y_continuous(labels = scales::percent) + 
        ggplot2::theme_minimal() +
        ggplot2::theme(axis.title = ggplot2::element_blank())
    return(g) 
}