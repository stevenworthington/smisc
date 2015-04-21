
#' Length of a vector
#'
#' This function is a new version of length which can handle NA's.
#'
#' @param x a vector. 
#' @param na.rm count NA's? Defaults to FALSE.
#' @seealso \code{\link{length}}
#' @keywords length
#' @author Steven Worthington \email{sworthington@@iq.harvard.edu}
#' @examples
#' x <- c(1:9, NA)
#' len(x)
#' @export

len <- function (x, na.rm = FALSE) {
    if(na.rm) { sum(!is.na(x))
    } else length(x)
}


