% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/MazamaCovidUtils.R
\name{removeArchiveBaseDir}
\alias{removeArchiveBaseDir}
\title{Remove data archive base directory}
\usage{
removeArchiveBaseDir()
}
\value{
Silently returns previous value of the base directory.
}
\description{
Resets the data archive base directory to NULL. Used for internal 
testing.
}
\seealso{
\code{\link{ArchiveBaseDir}}, \code{\link{getArchiveBaseDir}},  
\code{\link{setArchiveBaseDir}}, \code{\link{removeArchiveBaseDir}}

\code{\link{ArchiveBaseUrl}}, \code{\link{getArchiveBaseUrl}},  
\code{\link{setArchiveBaseUrl}}, \code{\link{removeArchiveBaseUrl}}
}
\keyword{environment}
