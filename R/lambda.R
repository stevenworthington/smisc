
#' Pagel's lambda
#'
#' This function calculates Pagel's lambda parameter. For models of class MCMCglmm this is also called H^2.
#'
#' @param model a model object. Accepts models of class MCMCglmm.
#' @param gen generalized version of lambda including all random effects in denominator? Defaults to FALSE.
#' @return a vector of Pagel's lambda values whose length equals the size of the posterior sample.
#' @keywords lambda
#' @references Pagel (1999)
#' @author Steven Worthington \email{sworthington@@iq.harvard.edu}
#' @examples
#' \dontrun{
#' lambda_values <- lambda(model1)
#' plot(density(lambda_values))
#' posterior.mode(lambda_values)
#' mean(lambda_values)
#' median(lambda_values)
#' HPDinterval(lambda_values)
#' }
#' @export

lambda <- function(model) UseMethod("lambda")

lambda.MCMCglmm <- function(model, gen = FALSE) {
    if(class(model) != "MCMCglmm") stop("Not a model of class 'MCMCglmm'!")
    phyloCols <- grep("phylo", colnames(model$VCV))
    if(gen == TRUE) {
        lambda <- mcmc(rowSums(model$VCV[, phyloCols]) / rowSums(model$VCV))
    } else {
        lambda <- mcmc(rowSums(model$VCV[, phyloCols]) / rowSums(model$VCV[, grep("phylo|units", colnames(model$VCV))]))
    }
    lambda
}

