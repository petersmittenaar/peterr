context('Clipping numeric vector')

test_that('Function returns clipped version', {
    expect_equal(Clip(c(1,2,3,4), 2, 3), c(2, 2, 3, 3))
    expect_equal(Clip(c(1, 2, NA, 4), 1, 2), c(1, 2, NA, 2))
    expect_equal(Clip(c(1, 2, 3, 4), upper = 3), c(1, 2, 3, 3))
    expect_equal(Clip(c(NA)), NA)


})