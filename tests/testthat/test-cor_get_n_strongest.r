context('Get N strongest correlations')
test_that('Function returns tibble with expected columns', {
    res = CorGetNStrongest(iris)
    expect_true(is.data.frame(res))
    expect_equal(names(res), c('var1', 'var2', 'r'))

context('Get N strongest correlations')
test_that('CorGetNStrongest returns expected columns and rows', {
    df <- data.frame(a = 1:5,
                     b = c(5,4,3,2,1),
                     c = c(2,3,4,5,6))
    res <- CorGetNStrongest(df, n = 2)
    expect_equal(colnames(res), c('var1', 'var2', 'r'))
    expect_equal(nrow(res), 2)

})
