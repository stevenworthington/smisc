
#' Return last element(s) of vector
#'
#' This function returns the last element(s) of a vector. Use last(x) instead of x[length(x)]. Works on matrices too.
#'
#' @param x a vector or matrix. 
#' @param n number of elements to return.
#' @seealso \code{\link{tail}}
#' @keywords tail
#' @author Steven Worthington \email{sworthington@@iq.harvard.edu}
#' @examples
#' x <- letters
#' last(x)
#' @export
 
last <- function(x) tail(x, n = 1)

