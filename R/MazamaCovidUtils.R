#' @docType package
#' @name MazamaCovidUtils
#' @title Data access and analysis functions for COVID-19 related data
#' @description This package contains code to access current COVID-19 data from
#' various sources.
#'
NULL

# ----- Package Data -----------------------------------------------------------

# Found in R/data.R

# ----- Internal Package State -------------------------------------------------

MazamaCovidUtilsEnv <- new.env(parent = emptyenv())
MazamaCovidUtilsEnv$archiveBaseDir <- NULL
MazamaCovidUtilsEnv$archiveBaseUrl <- NULL

#' @docType data
#' @keywords environment
#' @name ArchiveBaseDir
#' @title Base directory for pre-generated data
#' @format Directory string.
#' @description If an archive of pre-generated data files is available locally,
#' users can set the location of this directory with\code{setArchiveBaseDir()}.
#' Otherwise, users must specify an external source of pre-generated datafiles 
#' with \code{setArchiveBaseUrl()}.
#' 
#' To avoid internet latency, specification of BASE_DIR will always take 
#' precedence over specification of BASE_URL.
#' 
#' Package functions that load pre-generated data files will load data from this
#' directory.
#' 
#' @seealso \code{\link{ArchiveBaseDir}}, \code{\link{getArchiveBaseDir}},  
#' \code{\link{setArchiveBaseDir}}, \code{\link{removeArchiveBaseDir}}
#' @seealso \code{\link{ArchiveBaseUrl}}, \code{\link{getArchiveBaseUrl}},  
#' \code{\link{setArchiveBaseUrl}}, \code{\link{removeArchiveBaseUrl}}
NULL

#' @keywords environment
#' @export
#' @title Get data archive base directory
#' @description Returns the package base directory pointing to an archive of
#' pre-generated data files.
#' @return directory string.
#' @seealso \code{\link{ArchiveBaseDir}}, \code{\link{getArchiveBaseDir}},  
#' \code{\link{setArchiveBaseDir}}, \code{\link{removeArchiveBaseDir}}
#' @seealso \code{\link{ArchiveBaseUrl}}, \code{\link{getArchiveBaseUrl}},  
#' \code{\link{setArchiveBaseUrl}}, \code{\link{removeArchiveBaseUrl}}
getArchiveBaseDir <- function() {
  # NULL is an acceptable value
  return(MazamaCovidUtilsEnv$archiveBaseDir)    
}

#' @keywords environment
#' @export
#' @title Set data archive base directory
#' @param archiveBaseDir Base directory pointing to an archive of pre-generated 
#' data files.
#' @description Sets the package base directory pointing to an archive of
#' pre-generated data files.
#' 
#' @return Silently returns previous value of base directory.
#' @seealso \code{\link{ArchiveBaseDir}}, \code{\link{getArchiveBaseDir}},  
#' \code{\link{setArchiveBaseDir}}, \code{\link{removeArchiveBaseDir}}
#' @seealso \code{\link{ArchiveBaseUrl}}, \code{\link{getArchiveBaseUrl}},  
#' \code{\link{setArchiveBaseUrl}}, \code{\link{removeArchiveBaseUrl}}
setArchiveBaseDir <- function(archiveBaseDir) {
  old <- MazamaCovidUtilsEnv$archiveBaseDir
  MazamaCovidUtilsEnv$archiveBaseDir <- stringr::str_remove(archiveBaseDir, "/$")
  return(invisible(old))
}

#' @keywords environment
#' @export
#' @title Remove data archive base directory
#' @description Resets the data archive base directory to NULL. Used for internal 
#' testing. 
#' @return Silently returns previous value of the base directory.
#' @seealso \code{\link{ArchiveBaseDir}}, \code{\link{getArchiveBaseDir}},  
#' \code{\link{setArchiveBaseDir}}, \code{\link{removeArchiveBaseDir}}
#' @seealso \code{\link{ArchiveBaseUrl}}, \code{\link{getArchiveBaseUrl}},  
#' \code{\link{setArchiveBaseUrl}}, \code{\link{removeArchiveBaseUrl}}
removeArchiveBaseDir <- function() {
  old <- MazamaCovidUtilsEnv$archiveBaseDir
  MazamaCovidUtilsEnv$archiveBaseDir <- NULL
  return(invisible(old))
}

#' @docType data
#' @keywords environment
#' @name ArchiveBaseUrl
#' @title Base URL for pre-generated data
#' @format URL string.
#' @description This package maintains an internal archive base URL which users 
#' can set using \code{setArchiveBaseUrl()}. Alternatively, if an archive of 
#' pre-generated data files is availalbe locally, users can set the location of 
#' this directory with\code{setArchiveBaseDir()}.
#' 
#' To avoid internet latency, specification of BASE_DIR will always take 
#' precedence over specification of BASE_URL.

#' Known base URLs include:
#' \itemize{
#' \item{http://data.mazamascience.com/PurpleAir/v1}
#' }
#' 
#' Package functions that load pre-generated data files download data from this
#' URL.
#' 
#' @seealso \code{\link{ArchiveBaseDir}}, \code{\link{getArchiveBaseDir}},  
#' \code{\link{setArchiveBaseDir}}, \code{\link{removeArchiveBaseDir}}
#' @seealso \code{\link{ArchiveBaseUrl}}, \code{\link{getArchiveBaseUrl}},  
#' \code{\link{setArchiveBaseUrl}}, \code{\link{removeArchiveBaseUrl}}
NULL

#' @keywords environment
#' @export
#' @title Get data archive base URL
#' @description Returns the package base URL pointing to an archive of
#' pre-generated data files.
#' @return URL string.
#' @seealso \code{\link{ArchiveBaseDir}}, \code{\link{getArchiveBaseDir}},  
#' \code{\link{setArchiveBaseDir}}, \code{\link{removeArchiveBaseDir}}
#' @seealso \code{\link{ArchiveBaseUrl}}, \code{\link{getArchiveBaseUrl}},  
#' \code{\link{setArchiveBaseUrl}}, \code{\link{removeArchiveBaseUrl}}
getArchiveBaseUrl <- function() {
  # Check for archiveBaseDir
  if ( is.null(MazamaCovidUtilsEnv$archiveBaseDir) &&
       is.null(MazamaCovidUtilsEnv$archiveBaseUrl) ) {
    stop('No BASE_URL set. Please set one with setArchiveBaseUrl("BASE_URL").')
  }
  return(MazamaCovidUtilsEnv$archiveBaseUrl)    
  
}

#' @keywords environment
#' @export
#' @title Set data archive base URL
#' @param archiveBaseUrl Base URL pointing to an archive of pre-generated data files.
#' @description Sets the package base URL pointing to an archive of
#' pre-generated data files.
#' 
#' @return Silently returns previous value of base URL.
#' @seealso \code{\link{ArchiveBaseDir}}, \code{\link{getArchiveBaseDir}},  
#' \code{\link{setArchiveBaseDir}}, \code{\link{removeArchiveBaseDir}}
#' @seealso \code{\link{ArchiveBaseUrl}}, \code{\link{getArchiveBaseUrl}},  
#' \code{\link{setArchiveBaseUrl}}, \code{\link{removeArchiveBaseUrl}}
setArchiveBaseUrl <- function(archiveBaseUrl) {
  old <- MazamaCovidUtilsEnv$archiveBaseUrl
  MazamaCovidUtilsEnv$archiveBaseUrl <- stringr::str_remove(archiveBaseUrl, "/$")
  return(invisible(old))
}

#' @keywords environment
#' @export
#' @title Remove data archive base URL
#' @description Resets the data archive base URL to NULL. Used for internal 
#' testing. 
#' @return Silently returns previous value of the base URL.
#' @seealso \code{\link{ArchiveBaseDir}}, \code{\link{getArchiveBaseDir}},  
#' \code{\link{setArchiveBaseDir}}, \code{\link{removeArchiveBaseDir}}
#' @seealso \code{\link{ArchiveBaseUrl}}, \code{\link{getArchiveBaseUrl}},  
#' \code{\link{setArchiveBaseUrl}}, \code{\link{removeArchiveBaseUrl}}
removeArchiveBaseUrl <- function() {
  old <- MazamaCovidUtilsEnv$archiveBaseUrl
  MazamaCovidUtilsEnv$archiveBaseUrl <- NULL
  return(invisible(old))
}

