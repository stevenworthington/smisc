
#' Mode
#'
#' This function returns the mode(s) of a set of values.
#'
#' @param x a vector (numerical or logical). 
#' @return modal value(s).
#' @keywords mode
#' @references taken from \url(http://stackoverflow.com/questions/2547402/standard-library-function-in-r-for-finding-the-mode)
#' @author Steven Worthington /email{sworthington@iq.harvard.edu}
#' @examples
#' x <- c(1, 1, 1, 2, 3, 4, 5, 5, 5)
#' Mode(x)
#' @export

Mode <- function(x) {
    ux <- unique(x)
    tab <- tabulate(match(x, ux))
    ux[tab == max(tab)]
}

