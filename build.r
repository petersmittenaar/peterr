# Document, test, and install the peterr package
#
# Run using Rscript build.r from the root directory
stopifnot(grepl('peterr$', getwd()))

if (!require(devtools)) install.packages("devtools")

devtools::document()
devtools::test()
devtools::install(upgrade = 'ask')

