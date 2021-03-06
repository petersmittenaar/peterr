% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot_elbow_kmeans.r
\name{PlotElbowKmeans}
\alias{PlotElbowKmeans}
\title{Return a plot with within-group sum of squares as function of number of clusters (k-means)}
\usage{
PlotElbowKmeans(df, max.clusters = 15, plot.title = "")
}
\arguments{
\item{df}{dataframe ready for kmeans (e.g. scaled)}

\item{max.clusters}{how to deal with missing values, see \code{\link{stats::cor}}}

\item{plot.title}{string to add to plot}
}
\value{
ggplot object
}
\description{
An "elbow plot" hopefully shows you how many clusters are appropriate, as indicated by a minimal reduction in within-group sum of squares upon increasing k. In reality, few data sets will show such an elbow, but it is nonetheless a common method.
Removes incomplete records.
}
\examples{
PlotElbowKmeans(iris[, 1:4])
}
\seealso{
\code{\link{stats::kmeans}} which this function wraps, and \link{https://stackoverflow.com/questions/15376075/cluster-analysis-in-r-determine-the-optimal-number-of-clusters} for original code
}
