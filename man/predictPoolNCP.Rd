\name{predictPoolNCP}
\alias{predictPoolNCP}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
The prediction model of non-centrality parameter
}
\description{
It is based on our simulation results.
}
\usage{
predictPoolNCP(MAF, OR, error, P, N.p, Xmean)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{MAF}{
minor allele frequency}
  \item{OR}{
odds ratio}
  \item{error}{
sequencing error}
  \item{P}{
number of pools (case+control)}
  \item{N.p}{
number of individuals per pool}
  \item{Xmean}{
average coverage per pool}
}
\author{
Wei E. Liang
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\examples{

## The function is currently defined as
function(MAF, OR, error, P, N.p, Xmean){
count <- 1
while(ncp.pool.pred[[1]][count] <= MAF) count<-count+1

ncp.pool.pred.coef <- ncp.pool.pred[[2]][[count]]

covariates <- c(1, MAF, log(OR), error, P, Xmean, N.p, (P^(1/3)), (Xmean^(1/3)), (N.p^(1/3)), (log(OR)^2), MAF*log(OR), Xmean*N.p, MAF*P, MAF*Xmean, MAF*N.p, log(OR)*P, log(OR)*Xmean, log(OR)*N.p, error*P, error*Xmean, error*N.p, MAF*Xmean*N.p, log(OR)*Xmean*N.p, MAF*log(OR)*P, MAF*log(OR)*Xmean, MAF*log(OR)*N.p, error*Xmean*N.p, MAF*log(OR)*Xmean*N.p)

ncp.pool.predicted <- (sum(ncp.pool.pred.coef * covariates))^3

ncp.pool.predicted
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
