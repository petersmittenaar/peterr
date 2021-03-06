% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/log_odds_to_prob.r
\name{LogOddsToProb}
\alias{LogOddsToProb}
\title{Convert log odds to probability}
\usage{
LogOddsToProb(x)
}
\arguments{
\item{x}{vector of log odds}
}
\value{
vector with probabilities
}
\description{
Logistic regression can tell you the log odds of the outcome occurring for each observation. In particular, \code{\link{broom::augment}} will add a column \code{.fitted} to your df with the log odds. Often you'll want to know the probability rather than log odds. This transforms a log odds into probability. You can get the same values using \code{predict(f, df, type='response')}.
}
\examples{
f = glm(Species == 'versicolor' ~ ., data=iris, family=binomial) 
df = broom::augment(f, iris)
df$.prob = LogOddsToProb(df$.fitted)
plot(df$.prob, df$Species == 'versicolor')

all(dplyr::near(df$.prob, predict(f, iris, type='response')))  # same thing as using predict()
}
