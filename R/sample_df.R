
#' Sample a data frame
#'
#' This function randomly samples rows from a dataframe.
#'
#' @param df a data frame. 
#' @param n the number of lines to sample.
#' @param ordered order the rows? Defaults to TRUE.
#' @keywords sample
#' @author Steven Worthington \email{sworthington@@iq.harvard.edu}
#' @examples
#' \dontrun{
#' sample_df()
#' }
#' @export

sample_df <- function(df, n = 3, ordered = TRUE) {
    if(ordered) {
            df[sort(sample(nrow(df), min(nrow(df), n))), ]
    } else {
            df[sample(nrow(df), min(nrow(df), n)), ]
    }
}

