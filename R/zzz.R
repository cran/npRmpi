.onAttach <- function (lib, pkg) {
	packageStartupMessage("Nonparametric Kernel Methods for Mixed Datatypes (version 0.40-13) + Rmpi 0.5-9", domain = NULL,  appendLF = TRUE)

  if(is.null(options('np.messages')$np.messages))
    options(np.messages = TRUE)

}
.Last.lib <- function (lpath){
  library.dynam.unload("npRmpi", libpath=lpath) 
}
.onLoad <- function (lib, pkg) {
  library.dynam("npRmpi", pkg, lib)
  if(!.Call("mpi_initialize",PACKAGE="npRmpi"))
    stop("Cannot start MPI_Init(). Exit")
  if (exists(".Random.seed") && 
      round(.Random.seed[1]-5,-1) == .Random.seed[1]-5) {
    rm(.Random.seed, envir=.GlobalEnv)
  }
}
