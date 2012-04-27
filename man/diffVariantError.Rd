\name{diffVariantError}
\alias{diffVariantError}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
differentiate a variant from sequencing error
}
\description{
This function finds a practical threshold to differentiate a variant call from sequencing error.
}
\usage{
diffVariantError(Xmean, N.p, error, N.test = 1)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{Xmean}{
The average coverage on the pool
}
  \item{N.p}{
The pool size: number of individuals per pool
}
  \item{error}{
Sequencing error rate
}
  \item{N.test}{
Number of tests, usually the same as number of pools P
}
}
\details{
It is a helper function to calculate the probability of detection.
}
\value{
diffVariantError() returns a vector c(v, p0, p1), where v is the threshold for a variant call, p0 is the false discovery rate and p1 is the lower bound of true discovery rate.
}
\author{
Wei E. Liang
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function(Xmean, N.p, error, N.test=1)
{
	theta <- (1-error)/(2*N.p) + error*(1-1/(2*N.p))

	for(v in 1:Xmean)
	{
		p1 <- pbinom(v-1, Xmean, theta, lower.tail=FALSE)
		p0 <- pbinom(v-1, Xmean, error, lower.tail=FALSE)
		
		if(p1/p0 > 5 & p0<0.05/N.test) break;
	}
	
	c(v, p0, p1)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
