
#' Inverse Value Matching
#'
#' Complement of \code{\%in\%}. Returns the elements of \code{x} that are not in \code{y}.
#'
#' @return A logical vector, indicating if a match was NOT located for each element of x: thus the values are TRUE or FALSE and never NA.
#' @usage x \%!in\% y
#' @seealso \code{\link{\%in\%}}
#' @keywords match
#' @author Steven Worthington \email{sworthington@@iq.harvard.edu}
#' @examples
#' x <- letters[1:5]
#' y <- letters[4:8]
#' x %!in% y
#' @export
#' @name notin

"%!in%" <- Negate("%in%")

