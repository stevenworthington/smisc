
#' List installed packages and versions
#'
#' This function lists installed packages and their versions.
#'
#' @seealso \code{\link{installed.packages}}
#' @keywords package
#' @author Steven Worthington \email{sworthington@@iq.harvard.edu}
#' @examples
#' packinfo()
#' @export

packinfo <- function(){
    packinfo <- installed.packages(fields = c ("Package", "Version", "Built"))
    versions <- packinfo[, c("Package", "Version", "Built")]
    versions[order(rownames(versions)), ]
}

