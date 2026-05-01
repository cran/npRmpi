## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  eval = FALSE
)

## -----------------------------------------------------------------------------
# library(npRmpi)
# 
# npRmpi.init(nslaves = 1)
# 
# set.seed(1)
# x <- runif(200)
# y <- sin(2 * pi * x) + rnorm(200, sd = 0.2)
# 
# bw <- npregbw(y ~ x, regtype = "ll", bwmethod = "cv.ls")
# fit <- npreg(bws = bw)
# summary(fit)
# 
# npRmpi.quit()

## -----------------------------------------------------------------------------
# if (requireNamespace("crs", quietly = TRUE) &&
#     utils::packageVersion("crs") >= package_version("0.15-41")) {
#   npRmpi.init(nslaves = 1)
# 
#   set.seed(7)
#   n <- 120
#   x <- runif(n, -1, 1)
#   y <- x + 0.4 * x^2 + rnorm(n, sd = 0.18)
# 
#   fit_nomad <- npreg(y ~ x, nomad = TRUE, degree.max = 1L, nmulti = 1L)
#   fit_nomad$bws$nomad.shortcut
# 
#   bw_nomad_only <- npregbw(
#     y ~ x,
#     nomad = TRUE,
#     search.engine = "nomad",
#     degree.max = 1L,
#     nmulti = 1L
#   )
#   bw_nomad_only$nomad.shortcut
# 
#   npRmpi.quit()
# }

## -----------------------------------------------------------------------------
# library(npRmpi)
# npRmpi.init(mode = "attach")
# 
# if (mpi.comm.rank(0L) == 0L) {
#   set.seed(1)
#   x <- runif(200)
#   y <- sin(2 * pi * x) + rnorm(200, sd = 0.2)
# 
#   bw <- npregbw(y ~ x, regtype = "ll", bwmethod = "cv.ls")
#   fit <- npreg(bws = bw)
#   summary(fit)
# 
#   npRmpi.quit(mode = "attach")
# }

## -----------------------------------------------------------------------------
# mpi.bcast.cmd(np.mpi.initialize(), caller.execute = TRUE)
# 
# set.seed(1)
# x <- runif(200)
# y <- sin(2 * pi * x) + rnorm(200, sd = 0.2)
# dat <- data.frame(y, x)
# 
# mpi.bcast.Robj2slave(dat)
# mpi.bcast.cmd(
#   bw <- npregbw(y ~ x, regtype = "ll", bwmethod = "cv.ls", data = dat),
#   caller.execute = TRUE
# )
# mpi.bcast.cmd(
#   fit <- npreg(bws = bw, data = dat),
#   caller.execute = TRUE
# )
# 
# summary(fit)
# mpi.bcast.cmd(mpi.quit(), caller.execute = TRUE)

