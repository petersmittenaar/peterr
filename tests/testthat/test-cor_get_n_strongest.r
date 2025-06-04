context('Get n strongest correlations')

test_that('Function returns tibble with expected columns', {
    res = CorGetNStrongest(iris)
    expect_true(is.data.frame(res))
    expect_equal(names(res), c('var1', 'var2', 'r'))
})
