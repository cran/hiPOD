\name{FindOptPower}
\alias{FindOptPower}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
search for the optimal pooled design
}
\description{
Perform a grid search over potential design space, and find the predicted power and validity of the designs.
}
\usage{
FindOptPower(cost, sample.size, MAF, OR, error, costPerExp = 18915, costPerPool = 970, costPerX = 300, lower.P = 20, upper.P = 400, lower.N.p = 2, upper.N.p = 200, lower.Xmean = 4, upper.Xmean = 1280, sig.level = 0.05, Number.Grids = 100)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{cost}{
cost constraint of the study
}
  \item{sample.size}{
sample size constraint of the study
}
  \item{MAF}{
assumed MAF of the variant of interest
}
  \item{OR}{
assume effect size (odds ratio) of the variant of interest
}
  \item{error}{
assume sequencing error rate
}
  \item{costPerExp}{
cost per experiment
}
  \item{costPerPool}{
cost per pool
}
  \item{costPerX}{
cost per 1X coverage
}
  \item{lower.P}{
lower bound of number of pools in potential consideration
}
  \item{upper.P}{
upper bound of number of pools in potential consideration
}
  \item{lower.N.p}{
lower bound of number of pool size in potential consideration
}
  \item{upper.N.p}{
upper bound of number of pool size in potential consideration
}
  \item{lower.Xmean}{
lower bound of number of coverage per pool in potential consideration
}
  \item{upper.Xmean}{
upper bound of number of coverage per pool in potential consideration
}
  \item{sig.level}{
significance level of the statistic test, usually 0.05 for a single test
}
  \item{Number.Grids}{
number of grids in the search space, preset as 100
}
}
\details{
Given the research question and the study constraints, this function calculates the power and validity of all the potential pooled designs.
}
\value{
Returns a list:
	\item{cost }{}
	\item{sample.size }{}
	\item{constraint.set }{}
	\item{scenario.set }{}
	\item{designs }{the potential designs, validity and power}
}
\author{
Wei E. Liang
}


%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{PlotOptPower}}, \code{\link{ShowOptDesign}}
}
\examples{

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
######## Example 1: A simple example, with very rough grid points (only 20X20 grid points)
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

##### Find the optimal design
example.1 <- FindOptPower(cost=452915, sample.size=5000, MAF=0.03, OR=2, error=0.01, upper.P=200, Number.Grids=20)

##### assign a directory to store the contour plots
##### with your own choice
proj.Dir <- paste(getwd(), "/hiPOD_examples", sep="")
if(!file.exists(proj.Dir)) dir.create(proj.Dir)

##### Inferences on the optimal designs
PlotOptPower(example.1, save.contour=FALSE, plot.3d=FALSE)
# # snapshot3d(filename = paste(proj.Dir, "/example1_3d.bmp", sep=""))
ShowOptDesign(example.1, 5)

}





% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
