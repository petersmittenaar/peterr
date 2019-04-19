# peterr
Personal package with R functions by Peter Smittenaar. Install at your own risk. 

```
install.packages("devtools")
devtools::install_github('petersmittenaar/peterr')
library(peterr)
```

### How to build and test after adding new function
Updated: just do `Rscript build.r` from command line.

**Manually**
Open up R

```
setwd('./peterr')
# install.packages("devtools")
# devtools::install_github("klutometis/roxygen")
library(roxygen2)
library(devtools)
devtools::test()
document()
setwd('..')
install('peterr')
```

### To do


### Acknowledgements
[Hilary Parker](https://hilaryparker.com/2014/04/29/writing-an-r-package-from-scratch/)'s guide to writing your own personal package, [Karl Broman](https://github.com/kbroman/broman)'s package, and [Hadley Wickham](http://r-pkgs.had.co.nz/). 