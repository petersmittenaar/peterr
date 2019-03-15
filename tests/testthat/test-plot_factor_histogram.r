context('Generate factor histogram')

test_that('Function returns content-full ggplot object for valid input', {
    v = factor(c(1,2,3))
    g = plot_factor_histogram(v)
    expect_equal(length(g$data), 1)
    expect_equal(length(g$layers), 1)
    expect_equal(length(g$labels), 3)
})

test_that('Function returns empty ggplot object for invalid input', {
    # run into environment issues if running expect_equivalent or expect_equal. 
    # Cannot find straightforward solution, so only test to find the warning for now.

    # empty_ggplot = ggplot2::ggplot() + ggplot2::theme_minimal()
    expect_warning(plot_factor_histogram(1:100))  # too many factors
    expect_warning(plot_factor_histogram(1:4, max.levels=3))  # too many factors
    expect_warning(plot_factor_histogram(NA))  # factor with no levels
    expect_warning(plot_factor_histogram(factor(c(), levels=(c('foo', 'bar')))))  # factor levels but no elements
    })