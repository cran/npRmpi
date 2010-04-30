\name{mpi.bcast.cmd}
\title{Extension of MPI\_Bcast API}
\alias{mpi.bcast.cmd}
\description{
  \code{mpi.bcast.cmd} is an extension of \code{\link{mpi.bcast}}. 
  It is mainly used to transmit a command from master to all R slaves 
  spawned by using slavedaemon.R script.
}
\usage{
mpi.bcast.cmd(cmd=NULL, rank = 0, comm = 1, caller.execute=FALSE)
}
\arguments{
  \item{cmd}{a command to be sent for master.}
  \item{rank}{the sender}
  \item{comm}{a communicator number}
  \item{caller.execute}{a logical value indicating whether the master
    node is additionally to execute the command}
}
\value{
  \code{mpi.bcast.cmd} returns no value for the sender and an expression 
  of the transmitted command for others.
} 
\details{
  \code{\link{deparse}} is used to convert a command into a char vector. 
  Some syntax errors of the command will be automatically detected by 
  \code{deparse}. Then the char vector is broadcasted to all members. After 
  receiving the char vector, the receivers use \code{\link{parse}} to convert 
  the char vector into an expression. Finally slavedaemon.R script will evaluate 
  this expression. Hence \code{mpi.bcast.cmd} is only used by slavedaemon.R, 
  or by whatever a R script based on slavedaemon.R. Please use  
 \code{\link{mpi.remote.exec}} if you want the executed results returned from R 
  slaves.
 }
\author{
Hao Yu (minor modifications by  Jeffrey S. Racine \email{racinej@mcmaster.ca})
}
\seealso{
  \code{\link{mpi.remote.exec}}
}
%\examples{
%}
\keyword{utilities}
