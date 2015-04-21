
#' Trim whitespace
#'
#' This function returns strings w/o leading and/or trailing whitespace.
#'
#' @param x a character string or character vector.
#' @param leading trim leading whitespace? Defaults to TRUE. 
#' @param trailing trim trailing whitespace? Defaults to TRUE.
#' @keywords whitespace
#' @author Steven Worthington \email{sworthington@@iq.harvard.edu}
#' @examples
#' x <- c(" help", "me ", " to ", "remove", "whitespace  ")
#' trim(x)
#' @export

trim <- function(x, leading = TRUE, trailing = TRUE) {
    if(!is.character(x)) stop("x is not a character string or character vector")
    if(leading == TRUE && trailing == FALSE) {
        gsub("^\\s+", "", x) 
    } else 
    if(leading == FALSE && trailing == TRUE) {
        gsub("\\s+$", "", x)
    } else
    if(leading == TRUE && trailing == TRUE) {
        gsub("^\\s+|\\s+$", "", x)
    } else
    x
}

