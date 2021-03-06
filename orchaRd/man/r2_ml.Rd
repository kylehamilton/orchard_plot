% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/r2_ml.R
\name{r2_ml}
\alias{r2_ml}
\title{r2_ml}
\usage{
r2_ml(model)
}
\arguments{
\item{model}{Model object of class 'rma.mv', 'rma'}
}
\value{
A data frame containing all the model results including mean effect size estimate, confidence and prediction intervals with estimates converted back to r
}
\description{
R2 (R-squared) for mixed (mulitlevel) models, based on Nakagawa & Schielzeth (2013)
}
\examples{
\dontrun{
data(lim)
lim$vi<-(1/sqrt(lim$N - 3))^2
lim_MR<-metafor::rma.mv(yi=yi, V=vi, mods=~Phylum-1, random=list(~1|Article, ~1|Datapoint), data=lim)
R2 <- r2_ml(lim_MR)
}
}
\references{
Nakagawa, S, and Schielzeth, H. 2013. A general and simple method for obtaining R2 from generalized linear mixed‐effects models. *Methods in Ecology and Evolution* 4(2): 133-142.
}
\author{
Shinichi Nakagawa - s.nakagawa@unsw.edu.au

Daniel Noble - daniel.noble@anu.edu.au
}
