\name{islet.solve}
\alias{islet.solve}
\title{
Solving individual-specific and cell-type-specific reference panels
}
\description{
This function, \code{islet.solve}, is a core function of ISLET. It takes the output from data preparation function \code{dataprep}, and solve for individual-specific and cell-type-specific reference panels. It has parallel computing implemented to speed up the EM algorithm application.
}
\usage{
islet.solve(input)
}

\arguments{
  \item{input}{
The list object output from data preparation function \code{dataprep}.
}
}
\details{
For both case group and control group, the deconvolution result is a list of length \emph{K}, where \emph{K} is the number of cell types. For each of the \emph{K} elements, it is a matrix of dimension \emph{G} by \emph{N}. It stores the deconvoluted feature (\emph{G}) by subject (\emph{N}) values, for each of the \emph{K} elements.
}
\value{
\item{case.ind.ref}{A list of length \emph{K}, where \emph{K} is the number of cell types. For each of the \emph{K} elements in this list, it is a feature by subject matrix containing all the feature values (i.e. gene expression values), for case group. It is one of the main products the individual-specific and cell-type-specific solve algorithm. }
\item{ctrl.ind.ref}{A list of length \emph{K}, where \emph{K} is the number of cell types. For each of the \emph{K} elements in this list, it is a feature by subject matrix containing all the feature values (i.e. gene expression values), for control group. It is one of the main products the individual-specific and cell-type-specific solve algorithm. }
\item{mLLK}{A scalar. The log-likelihood from the current model. It can be useful for testing purpose such as Likelihood Ratio Test.}
}

\author{
Hao Feng <hxf155@case.edu>
}


\examples{
data(GE600)
ls()
## [1] "case.dat" "ctrl.dat"

#(1) Data preparation
study123input = dataprep(case_dat_se = case.dat, ctrl_dat_se = ctrl.dat)

#(2) Individual-specific and cell-type-specific deconvolution
result = islet.solve(input = study123input)
}
