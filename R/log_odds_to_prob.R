#' Convert log odds to probability
#' 
#' Logistic regression can tell you the log odds of the outcome occurring for each observation. In particular, \code{\link{broom::augment}} will add a column \code{.fitted} to your df with the log odds. Often you'll want to know the probability rather than log odds. This transforms a log odds into probability. You can get the same values using \code{predict(f, df, type='response')}.
#' @param x vector of log odds
#' @return vector with probabilities
#' @export
#' @examples 
#' f = glm(Species == 'versicolor' ~ ., data=iris, family=binomial) 
#' df = broom::augment(f, iris)
#' df$.prob = log_odds_to_prob(df$.fitted)
#' plot(df$.prob, df$Species == 'versicolor')
#'
#' all(dplyr::near(df$.prob, predict(f, iris, type='response')))  # same thing as using predict()
log_odds_to_prob = function(x) {
    return(exp(x) / (1+exp(x)))
}