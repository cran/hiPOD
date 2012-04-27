\name{XmeanGivenCost}
\alias{XmeanGivenCost}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
A function used to find best coverage given cost and other constraints
}
\description{
A function used to find best coverage given cost and other constraints
}
\usage{
XmeanGivenCost(costPar, cost, P, lower.Xmean, upper.Xmean)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{costPar}{
%%     ~~Describe \code{costPar} here~~
}
  \item{cost}{
%%     ~~Describe \code{cost} here~~
}
  \item{P}{
%%     ~~Describe \code{P} here~~
}
  \item{lower.Xmean}{
%%     ~~Describe \code{lower.Xmean} here~~
}
  \item{upper.Xmean}{
%%     ~~Describe \code{upper.Xmean} here~~
}
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
function(costPar, cost, P, lower.Xmean, upper.Xmean)
{
	
	CostPerExp <- costPar[1]
	CostPerPool <- costPar[2]
	CostPerX <- costPar[3]

	cost <- rep(cost, length(P))

	Xmean.max <- floor((cost-CostPerExp-CostPerPool*P)/(CostPerX*P))
	Xmean.good <- (Xmean.max >= rep(lower.Xmean, length(Xmean.max)))

	Xmean.max <- ifelse(Xmean.max<lower.Xmean, lower.Xmean, Xmean.max)
	Xmean.max <- ifelse(Xmean.max>upper.Xmean, upper.Xmean, Xmean.max)

	list(Xmean.good, Xmean.max)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
