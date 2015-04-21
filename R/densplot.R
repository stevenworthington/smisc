
#' Kernal density plot
#'
#' This function creates a nice kernal density plot.
#'
#' @param x a numeric vector. 
#' @seealso \code{\link{density}}
#' @keywords density
#' @author Steven Worthington \email{sworthington@@iq.harvard.edu}
#' @examples
#' x <- rnorm(100, 10, 3)
#' densplot(x)
#' @export

densplot <- function (x) {
    if(!is.numeric(x)) stop("x is not numeric!")
    d <- density(x, na.rm = TRUE)
    plot(d, type = "n", main = deparse( substitute(x) ) )
    polygon(d, col = "cornflowerblue", border = NA) 
    rug(x)
}
