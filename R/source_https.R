
#' Source R script over HTTPS
#'
#' This function sources an R script that is hosted over a HTTPS connection (e.g., github).
#'
#' @param url a valid URL. 
#' @param ... additional arguments.
#' @seealso \code{\link{source}}
#' @keywords source
#' @author Steven Worthington \email{sworthington@@iq.harvard.edu}
#' @examples
#' \dontrun{
#' source_https()
#' }
#' @export

source_https <- function(url, ...) {
  # load package
  require(RCurl)
  # parse and evaluate each .R script
  sapply(c(url, ...), function(u) {
      eval(parse(text = getURL(u, followlocation = TRUE,
           cainfo = system.file("CurlSSL", "cacert.pem", package = "RCurl"))),
           envir = .GlobalEnv)
  })
}

