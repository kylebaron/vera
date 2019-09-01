context("basic functionality")

mod <- suppressMessages(mrgsolve::modlib("pk1"))

fun <- function(p) {
  mod %>%
    param(p) %>%
    ev(amt = 100) %>%
    mrgsim()
}

test_that("basic sensitivity analysis", {
  out <- lsa(mod, fun, par = "CL,KA", var = "CP")
  expect_is(out,"data.frame")
  expect_is(out,"lsa")
  expect_identical(names(out),c("time", "var", "value", "par", "sens"))
  expect_true(all(out[["var"]]=="CP"))
  expect_identical(unique(out[["par"]]),c("CL", "KA"))
})

test_that("error for bad parameter", {
  expect_error(lsa(mod, fun, par = "KYLE", var = "CP"))
})

test_that("error for bad output", {
  expect_error(lsa(mod, fun, par = "CL", var = "BARON"))
})

if(requireNamespace("ggplot2")) {
  test_that("plot output", {
    out <- lsa(mod, fun, par = "CL,KA", var = "CP")
    ans <- plot(out)
    expect_is(ans, "gg")
  })
}
