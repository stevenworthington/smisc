
#' Multiple package install and load
#'
#' This function installs new packages and loads them into an R session.
#'
#' @param pkg a vector of package names in quotes. 
#' @seealso \code{\link{install.packages}}
#' @keywords package
#' @author Steven Worthington \email{sworthington@@iq.harvard.edu}
#' @examples
#' \dontrun{
#' packages <- c("ggplot2", "scales", "plyr")
#' ipak(packages)
#' }
#' @export

ipak <- function(pkg){
    new.pkg <- pkg[!(pkg %in% installed.packages()[, "Package"])]
    if(length(new.pkg)) install.packages(new.pkg, dependencies = TRUE)
    sapply(pkg, require, character.only = TRUE)
}

