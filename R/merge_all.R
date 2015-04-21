
#' Multiple merges
#'
#' This function merges multiple data frames.
#'
#' @param dflist a list of data frames. 
#' @param by.var a vector of variable names in quotes to use in merging the data frames.
#' @return a merged data frame.
#' @seealso \code{\link{merge}}
#' @keywords merge
#' @author Steven Worthington \email{sworthington@@iq.harvard.edu}
#' @examples
#' \dontrun{
#' merge_all()
#' }
#' @export

# merge multiple data frames
merge_all <- function(dflist, by.var) {
    Reduce(function(...) merge(..., by = by.var, all = TRUE), dflist)
}
