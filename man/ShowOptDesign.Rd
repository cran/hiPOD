\name{ShowOptDesign}
\alias{ShowOptDesign}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Print the top choices of designs
}
\description{
Show the top [num.designs] choices of valid designs.
}
\usage{
ShowOptDesign(opt.design.results, num.designs = 10)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{opt.design.results}{
%%     ~~Describe \code{opt.design.results} here~~
}
  \item{num.designs}{
%%     ~~Describe \code{num.designs} here~~
}
}
\value{
a dataframe including the top choices.
}
\author{
Wei E. Liang
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{FindOptPower}}, \code{\link{PlotOptPower}}
}
\examples{
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
######## Example 1: A simple example, with very rough grid points (only 20X20 grid points)
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

##### Find the optimal design
example.1 <- FindOptPower(cost=700000, sample.size=5000, MAF=0.03, OR=2, error=0.01, upper.P=200, Number.Grids=50)

##### assign a directory to store the contour plots
##### with your own choice
proj.Dir <- paste(getwd(), "/hiPOD_examples", sep="")
if(!file.exists(proj.Dir)) dir.create(proj.Dir)

##### Inferences on the optimal designs
PlotOptPower(example.1, save.contour=FALSE, plot.3d=FALSE)

ShowOptDesign(example.1, 5)
ShowOptDesign(example.1, 10)





## The function is currently defined as
function(opt.design.results, num.designs=10)
{
designs.good <- subset(opt.design.results[[5]], subset=(is.valid.design & upper.sample.good & Xmean.good))
head(designs.good[order(-designs.good$pred.power), ], num.designs)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
