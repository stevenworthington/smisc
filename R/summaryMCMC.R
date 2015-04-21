
#' Summary of MCMCglmm model
#'
#' This function produces a quick summary of a MCMCglmm model. 
#' 
#' @param model a model of class MCMCglmm. 
#' @param prob the range for the highest probability density interval. Defaults to 95\%.
#' @param m the magnitude.
#' @param digits the number of digits to round to.
#' @keywords summary
#' @references Forked from Schaun Wheeler's GitHub.
#' @author Steven Worthington \email{sworthington@@iq.harvard.edu}
#' @examples
#' \dontrun{
#' summaryMCMC()
#' }
#' @export

summaryMCMC <- function(model, prob = .95, m = 2, digits = 4) {
    model_mean <- colMeans(model$Sol)
    model_hpd <- HPDinterval(model$Sol, prob = prob)
    model_types <- ifelse(colMeans(model$Sol) > 0, colMeans(model$Sol < 0), colMeans(model$Sol > 0))
    raw_typem <- ifelse(colMeans(model$Sol) > 0,
        colMeans(t(apply(model$Sol, MARGIN = 1, function(x) { x[x < 0] <- 0; model_mean/m - x})) > 0),
        colMeans(t(apply(model$Sol, MARGIN = 1, function(x) { x[x > 0] <- 0; model_mean/m - x})) < 0))
    model_typem <- raw_typem - model_types

    output <- data.frame(
        mean = model_mean,
        hpd = model_hpd,
        type_S = model_types,
        type_M = model_typem
    ) 
    round(output, digits = digits)
}


