## Make sure you have the .Rprofile file from npRmpi/inst/ in your
## current directory or home directory. It is necessary.

## To run this on systems with OPENMPI installed and working, try
## mpirun -np 2 R CMD BATCH npsigtest_npRmpi. Check the time in the
## output file foo.Rout (the name of this file with extension .Rout),
## then try with, say, 4 processors and compare run time.

## Initialize master and slaves.

mpi.bcast.cmd(np.mpi.initialize(),
              caller.execute=TRUE)

## Turn off progress i/o as this clutters the output file (if you want
## to see search progress you can comment out this command)

mpi.bcast.cmd(options(np.messages=FALSE),
              caller.execute=TRUE)

mpi.bcast.cmd(set.seed(42),
              caller.execute=TRUE)

## Significance testing with z irrelevant

n <- 500
z <- factor(rbinom(n,1,.5))
x1 <- rnorm(n)
x2 <- runif(n,-2,2)
y <- x1 + x2 + rnorm(n)

mpi.bcast.Robj2slave(z)
mpi.bcast.Robj2slave(x1)
mpi.bcast.Robj2slave(x2)
mpi.bcast.Robj2slave(y)

t <- system.time(mpi.bcast.cmd(model <- npreg(y~z+x1+x2,
                                                  regtype="ll",
                                                  bwmethod="cv.aic"),
                                   caller.execute=TRUE))

## An example of the consistent nonparametric significance test

t <- t + system.time(mpi.bcast.cmd(output <- npsigtest(model),
                               caller.execute=TRUE ))

output

cat("Elapsed time =", t[3], "\n")

## Clean up properly then quit()

mpi.bcast.cmd(mpi.quit(),
              caller.execute=TRUE)
