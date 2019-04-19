context('Writing data to clipboard')

test_that('Function returns TRUE when writing valid object', {
    expect_true(WriteXclip(c(1,2,3)))
    expect_true(WriteXclip(data.frame(x=c(1, 2, 3))))
    expect_true(WriteXclip('hello world'))
})