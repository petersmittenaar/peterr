context('Writing data to clipboard')

test_that('Function returns TRUE when writing valid object', {
    expect_true(write_xclip(c(1,2,3)))
    expect_true(write_xclip(data.frame(x=c(1, 2, 3))))
    expect_true(write_xclip('hello world'))
})