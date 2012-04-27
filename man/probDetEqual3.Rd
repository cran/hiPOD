\name{probDetEqual3}
\alias{probDetEqual3}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Probability of Detection
}
\description{
Find the probability of detection.
}
\usage{
probDetEqual3(MAF, Xmean, T, N.p, error)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{MAF}{
%%     ~~Describe \code{MAF} here~~
}
  \item{Xmean}{
%%     ~~Describe \code{Xmean} here~~
}
  \item{T}{
The threshold, usually calculated from diffVariantError()
}
  \item{N.p}{
%%     ~~Describe \code{N.p} here~~
}
  \item{error}{
%%     ~~Describe \code{error} here~~
}
}

\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function(MAF, Xmean, T, N.p, error)
{
	pDetEqual <- 0;
	for(n in 0:(2*N.p))
	{
		pConf <- dbinom(n,2*N.p,MAF);
		pDet.not <- 0;
		theta <- (1-error)*n/(2*N.p) + error*(1-n/(2*N.p))
		
		pDet <- pbinom(T-1, Xmean, theta, lower.tail=FALSE)

		pDetEqual <- pDetEqual + pConf*pDet;
	}	
	pDetEqual
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
