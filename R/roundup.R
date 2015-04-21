
#' Round floats up
#'
#' This function redefines the round function to "round up" instead of "round to even".
#'
#' @param x a numeric vector. 
#' @seealso \code{\link{round}}
#' @keywords round
#' @author Steven Worthington \email{sworthington@@iq.harvard.edu}
#' @examples
#' x <- rnorm(10, 10, 3)
#' roundup(x)
#' @export

roundup <- function(x) trunc(x + 0.5)

