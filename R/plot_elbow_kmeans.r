#' Return a plot with within-group sum of squares as function of number of clusters (k-means)
#'
#' An "elbow plot" hopefully shows you how many clusters are appropriate, as indicated by a minimal reduction in within-group sum of squares upon increasing k. In reality, few data sets will show such an elbow, but it is nonetheless a common method.
#' Removes incomplete records.
#' @param df dataframe ready for kmeans (e.g. scaled)
#' @param max.clusters maximum number of clusters to examine
#' @param plot.title string to add to plot
#' @return ggplot object
#' @seealso \code{\link{stats::kmeans}} which this function wraps, and \link{https://stackoverflow.com/questions/15376075/cluster-analysis-in-r-determine-the-optimal-number-of-clusters} for original code
#' @export
#' @examples
#' PlotElbowKmeans(iris[, 1:4])
PlotElbowKmeans = function(df, max.clusters=15, plot.title='') {
  if (max.clusters < 2) max.clusters = 2
  # remove incomplete records
  df = df[complete.cases(df), ]

  wss <- (nrow(df)-1)*sum(apply(df, 2, stats::var))
  for (i in 2:max.clusters) {
    wss[i] <- sum(stats::kmeans(df, centers = i)$withinss)
  }
  g = ggplot2::qplot(1:max.clusters, wss, geom="point")
  g = g + ggplot2::labs(x = "Number of Clusters", y = "Within groups sum of squares", title = plot.title)
  g = g + ggplot2::theme_minimal()

  return(g)
}