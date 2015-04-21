
#' Summary plots
#'
#' This function produces summary histograms for each variable in a data frame. It splits the screen and finds the optimal number of columns and rows to be as close as possible to the desired aspect ratio.
#'
#' @param df a data frame. 
#' @param aspect the aspect ratio. Defaults to 1.
#' @keywords summary
#' @author Steven Worthington \email{sworthington@@iq.harvard.edu}
#' @examples
#' \dontrun{
#' summary_plot()
#' }
#' @export

summary_plot <- function(df, aspect = 1) {
  n <- ncol(df)
  dx <- par()$din[1]
  dy <- par()$din[2]
  f <- function(u,v) {
    if( u*v >= n && (u-1)*v < n && u*(v-1) < n ) {
      abs(log((dx/u)/(dy/v)) - log(aspect))
    } else { 
      NA 
    }
  }
  f <- Vectorize(f)
  r <- outer( 1:n, 1:n, f )
  r <- which( r == min(r,na.rm=TRUE), arr.ind=TRUE )
  r <- r[1,2:1]

  op <- par(mfrow=c(1,1),mar=c(2,2,2,2))
  plot.new()
  if( is.null( names(df) ) ) { names(df) <- 1:ncol(df) }
  ij <- matrix(seq_len(prod(r)), nr=r[1], nc=r[2], byrow=TRUE)
  for(k in seq_len(ncol(df))) {
    i <- which(ij==k, arr.ind=TRUE)[1]
    j <- which(ij==k, arr.ind=TRUE)[2]
    i <- r[1] - i + 1
    f <- c(j-1,j,i-1,i) / c(r[2], r[2], r[1], r[1] )
    par(fig=f, new=TRUE)
    if(is.numeric(df[,k])) { 
      hist(df[,k], las=1, col="grey", main=names(df)[k], xlab="", ylab="")
      o <- par(fig=c(
          f[1]*.4  + f[2]*.6,
          f[1]*.15 + f[2]*.85,
          f[3]*.4  + f[4]*.6,
          f[3]*.15 + f[4]*.85
        ), 
        new=TRUE,
        mar=c(0,0,0,0)
      )
      qqnorm(df[,k],axes=FALSE,xlab="",ylab="",main="")
      qqline(df[,k])
      box()
      par(o)
    } else {
      o <- par(mar=c(2,5,2,2))
      barplot(table(df[,k]), horiz=TRUE, las=1, main=names(df)[k])
      par(o)
    }
  }
  par(op)
}

