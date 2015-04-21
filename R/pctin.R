#' percent in
#' 
#' calculate the percentage of elements of \code{table} that are in \code{x}
#' 
#' @param x vector or NULL: the values to be matched
#' @param table vector or NULL: the values to be matched against
#' @return percentage of elements of \code{x} that are in \code{table}
#' @author gsee
#' @usage x \%pctin\% table
#' @examples
#' letters[1:10] %pctin% letters[1:3] # 30% of the second arg ar in the first
#' @export
#' @name pctin

"%pctin%" <- function(x, table) length(x[x %in% table])/length(x)
