
Sys.setenv("R_TESTS" = "")

library(testthat)
library(vera)
test_check("vera", reporter="summary")


