
#' Coefficient of variation small samples
#'
#' This function calculates the coefficient of variation for small sample sizes.
#'
#' @param sd the standard deviation of a variable. 
#' @param m the mean of a variable. 
#' @param n the number of elements in a variable.
#' @return The small sample coefficient of variation.
#' @keywords variance
#' @note The small sample coefficient of variation will converge on the large sample coefficient of variation as sample size increases.
#' @author Steven Worthington \email{sworthington@@iq.harvard.edu}
#' @examples
#' \dontrun{
#' CVs()
#' }
#' @export

CVs <- function(sd, m, n) (1 + (1 / (4 * n))) * (sd / m)
