context('Clipping numeric vector at standard deviation')

test_that('Function returns clipped version', {
    v = rep(c(rep(0, 100),100,-100))
    expect_equal(round(ClipAtSd(v, clip.at.sd = 2), 2), c(rep(0, 100), 28.14, -28.14))
    
})