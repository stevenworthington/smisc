
#' Robust standard errors for OLS models
#'
#' This function returns robust standard errors for objects of class lm.
#'
#' @param model an object of class lm. 
#' @param type the type of robust standard error to calculate. Defaults to "HC4m".
#' @keywords robust
#' @author Steven Worthington \email{sworthington@@iq.harvard.edu}
#' @examples
#' \dontrun{ 
#' robSE()
#' }
#' @export

# robust standard errors for OLS models
robSE <- function(model, type = "HC4m") {
    require(sandwich)
    cov_model <- vcovHC(model, type = type)
    std_err <- sqrt(diag(cov_model))
    r_est <- data.frame(
        estimate = coef(model),
        robust_SE = std_err,
        p_value = 2 * pnorm(abs(coef(model)/std_err), lower.tail = FALSE),
        lcl = coef(model) - 1.96 * std_err,
        ucl = coef(model) + 1.96 * std_err)
    return(r_est)
}

