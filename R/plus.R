
#' Concatenate two strings
#'
#' Concatenates two strings into a single string.
#'
#' @param x a character string.
#' @param y a character string.
#' @return Same as paste0(x, y).
#' @usage x \%+\% y
#' @examples
#' x <- letters[1:5]
#' y <- letters[4:8]
#' x %+% y
#' @export
#' @name plus

"%+%" <- function(x, y) paste0(x, y)
