% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/orchard_plot.R
\name{orchard_plot}
\alias{orchard_plot}
\title{orchard_plot}
\usage{
orchard_plot(
  object,
  mod = "Int",
  xlab,
  N = "none",
  alpha = 0.5,
  angle = 90,
  cb = TRUE,
  k = TRUE,
  transfm = c("none", "tanh")
)
}
\arguments{
\item{object}{model object of class 'rma.mv', 'rma' or 'orchard' table of model results}

\item{mod}{the name of a moderator. Otherwise, "Int" for intercept only model.}

\item{xlab}{The effect size measure label.}

\item{N}{The vector of sample size which an effect size is based on. If default, we use precision (the inverse of sampling standard error)}

\item{alpha}{The level of transparency for pieces of fruit (effect size)}

\item{angle}{The angle of y labels. The default is 90 degrees}

\item{cb}{If TRUE, it uses 8 colour blind friendly colors (7 colours plus grey)}

\item{k}{If TRUE, it displays k (number of effect sizes) on the plot}

\item{transfm}{If set to "tanh", a tanh transformation will be applied to effect sizes, converting Zr will to a correlation or pulling in extreme values for other effect sizes (lnRR, lnCVR, SMD). If "none" is chosen then it will default to}
}
\value{
Orchard plot
}
\description{
Using a metafor model object of class rma or rma.mv or a results table of class orchard, it creates a an orchard plot from mean effect size estimates for all levels of a given categorical moderator, their corresponding confidence intervals and prediction intervals
}
\examples{
\dontrun{
data(eklof) 
eklof<-metafor::escalc(measure="ROM", n1i=N_control, sd1i=SD_control,
m1i=mean_control, n2i=N_treatment, sd2i=SD_treatment, m2i=mean_treatment,
data=eklof)
# Add the unit level predictor
eklof$Datapoint<-as.factor(seq(1, dim(eklof)[1], 1))
# fit a MLMR - accouting for some non-independence
eklof_MR<-metafor::rma.mv(yi=yi, V=vi, mods=~ Grazer.type-1, random=list(~1|ExptID,
~1|Datapoint), data=eklof)
results <- mod_results(eklof_MR, mod = "Grazer.type")
orchard_plot(results, mod = Grazer.type, xlab = "log(Response ratio) (lnRR)")
# or
orchard_plot(eklof_MR, mod = Grazer.type, xlab = "log(Response ratio) (lnRR)")

# Example 2
data(lim)
lim$vi<- 1/(lim$N - 3)
lim_MR<-metafor::rma.mv(yi=yi, V=vi, mods=~Phylum-1, random=list(~1|Article,
~1|Datapoint), data=lim)
orchard_plot(lim_MR, mod = "Phylum", xlab = "Correlaiton coefficent", transfm = "tanh", N = lim$N)
}
}
\author{
Shinichi Nakagawa - s.nakagawa@unsw.edu.au

Daniel Noble - daniel.noble@anu.edu.au
}
