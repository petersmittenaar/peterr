% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/cor_get_n_strongest.r
\name{CorGetNStrongest}
\alias{CorGetNStrongest}
\title{Return strongest n correlations in dataframe}
\usage{
CorGetNStrongest(df, n = 10, method = "pearson",
  use = "pairwise.complete.obs")
}
\arguments{
\item{df}{dataframe (e.g. tibble)}

\item{n}{number of strongest correlations to return}

\item{method}{type of correlationn, see \code{\link{stats::cor}}}

\item{use}{how to deal with missing values, see \code{\link{stats::cor}}}
}
\value{
tibble with columns var1, var2, r
}
\description{
Takes a dataframe and calculates pairwise correlations between all numeric/logical variables. Returns a tibble with strongest n correlations. Might also return the p-value in the future.
}
\examples{
CorGetNStrongest(iris)
}
\seealso{
\code{\link{stats::cor}} which this function wraps
}
