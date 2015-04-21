
#' Summary standard errors and confidence intervals
#'
#' This function calculates count, mean, standard error of the mean, and confidence intervals of the mean for grouped variables. 
#'
#' @param df a data frame. 
#' @param measurevar the name of a column that contains the variable to be summariezed.
#' @param groupvars a vector containing names of columns that contain grouping variables.
#' @param na.remove should missing values be removed? Defaults to FALSE.
#' @param conf.interval the range of the confidence interval. Defaults to 95\%.
#' @param .drop drop redundant factor levels? Defaults to TRUE.
#' @keywords summary
#' @author Steven Worthington \email{sworthington@@iq.harvard.edu}
#' @examples
#' \dontrun{
#' summarySE()
#' }
#' @export
   
summarySE <- function(df = NULL, measurevar, groupvars = NULL, na.remove = FALSE,
                      conf.interval = .95, .drop = TRUE) {
    require(plyr)
    dfc <- ddply(df, groupvars, .drop = .drop,
                   .fun = function(x, col, na.rm) {
                           c( N    = len(x[, col], na.rm = na.remove),
                              mean = mean(x[, col], na.rm = na.remove),
                              sd   = sd(x[, col], na.rm = na.remove)
                             )
                          },
                       measurevar,
                       na.rm
                  )
    dfc <- rename(dfc, c("mean" = measurevar)) # rename the "mean" column
    dfc$se <- dfc$sd / sqrt(dfc$N)  # calculate standard error of the mean
    # confidence interval multiplier for standard error
    # calculate t-statistic for confidence interval: 
    # e.g., if conf.interval is .95, use .975 (above/below), and use df = N-1
    ciMult <- qt(conf.interval / 2 + .5, dfc$N - 1)
    dfc$ci <- dfc$se * ciMult
    dfc
}


