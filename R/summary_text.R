
#' Summary statistics
#'
#' This function produces summary statistics.
#'
#' @param df a data frame. 
#' @seealso \code{\link{summary}}
#' @keywords summary
#' @author Steven Worthington \email{sworthington@@iq.harvard.edu}
#' @examples
#' \dontrun{
#' summary_text()
#' }
#' @export

summary_text <- function(df) {
    do.call(rbind, lapply(df, function(u) {
        data.frame(
            Type    = class(u)[1],
            Min     = if(is.numeric(u)) min(   u, na.rm = TRUE) else NA,
            Mean    = if(is.numeric(u)) mean(  u, na.rm = TRUE) else NA,
            Median  = if(is.numeric(u)) median(u, na.rm = TRUE) else NA,
            Max     = if(is.numeric(u)) max(   u, na.rm = TRUE) else NA,
            Missing = sum(is.na(u))
            )  
        })    
    )
}
