context('Generate pretty histogram')

test_that('pretty_histogram accepts right data and returns correct objects', {
    legit_array = c(1,1,2,2,3)
    df = data.frame(v=c(1,1,2,2,3), y=c(1,2,3,4,5))
    all_missing = c(NA, NA)
    some_missing = c(1,2,3,NA,NA)
    null_object = NULL

    expect_s3_class(pretty_histogram(legit_array), c('gg', 'ggplot'))

    expect_warning(expect_s3_class(pretty_histogram(df), c('gg', 'ggplot')))

    expect_warning(expect_s3_class(pretty_histogram(all_missing), c('gg', 'ggplot')))

    expect_s3_class(pretty_histogram(some_missing), c('gg', 'ggplot'))

    expect_warning(expect_s3_class(pretty_histogram(null_object), c('gg', 'ggplot')))
})

test_that('pretty_histogram accepts ggplot22::labs values', {
    legit_array = c(1,1,2,2,3)
    expect_s3_class(pretty_histogram(legit_array, x='Test x', y='Test y', title='Test title'), c('gg', 'ggplot'))
})
