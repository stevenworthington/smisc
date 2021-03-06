% Generated by roxygen2 (4.1.0.9001): do not edit by hand
% Please edit documentation in R/len.R
\name{len}
\alias{len}
\title{Length of a vector}
\usage{
len(x, na.rm = FALSE)
}
\arguments{
\item{x}{a vector.}

\item{na.rm}{count NA's? Defaults to FALSE.}
}
\description{
This function is a new version of length which can handle NA's.
}
\examples{
x <- c(1:9, NA)
len(x)
}
\author{
Steven Worthington \email{sworthington@iq.harvard.edu}
}
\seealso{
\code{\link{length}}
}
\keyword{length}

