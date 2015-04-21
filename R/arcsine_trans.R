
#' Arcsine transformation
#'
#' This function performs an arcsine transformation.
#'
#' @param y a numeric vector to be transformed. 
#' @param n the number of elements in the numeric vector.
#' @return the arcsine transformed vector.
#' @keywords arcsine
#' @note The logit transformation has better proporties for transforming proportions.
#' @author Steven Worthington \email{sworthington@@iq.harvard.edu}
#' @examples
#' ntrials <- 40
#' successes <- 0.4
#' x <- rbinom(50, size = ntrials, prob = successes) / ntrials
#' arcsine_tran(x, ntrials)
#' @export
 
arcsine_tran <- function(y, n) {
    ratio <- (y + (3/8)) / (n + (3/4))
    arc_p <- asin( sqrt(ratio) )
    return(arc_p)
}
