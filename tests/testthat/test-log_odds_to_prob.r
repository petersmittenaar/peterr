context('Convert log odds to probability')

test_that('Function returns expected values', {
    v = c(-2, 0)
    expect_true(all(dplyr::near(log_odds_to_prob(v), c(0.1192029, 0.5), tol=.0001)))
})