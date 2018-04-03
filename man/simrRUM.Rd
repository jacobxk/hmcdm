% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/RcppExports.R
\name{simrRUM}
\alias{simrRUM}
\title{Simulate rRUM model responses (entire cube)}
\usage{
simrRUM(alphas, r_stars, pi_stars, Qs, test_order, Test_versions)
}
\arguments{
\item{alphas}{An N-by-K-by-T \code{array} of attribute patterns of all persons across T time points}

\item{r_stars}{A J-by-K-by-T \code{cube} of item penalty parameters for missing skills across all item blocks}

\item{pi_stars}{A J-by-T \code{matrix} of item correct response probability with all requisite skills across blocks}

\item{Qs}{A J-by-K-by-T  \code{cube} of Q-matrices across all item blocks}

\item{test_order}{A N_versions-by-T \code{matrix} indicating which block of items were administered to examinees with specific test version.}

\item{Test_versions}{A length N \code{vector} of the test version of each examinee}
}
\value{
An \code{array} of rRUM item responses of examinees across all time points
}
\description{
Simulate a cube of rRUM responses for all persons on items across all time points
}
\examples{
data("Spatial_Rotation")
Smats <- array(runif(Jt*K*(T),.1,.3),c(Jt,K,(T)))
Gmats <- array(runif(Jt*K*(T),.1,.3),c(Jt,K,(T)))
r_stars <- array(NA,c(Jt,K,T))
pi_stars <- matrix(NA,Jt,(T))
for(t in 1:T){
  pi_stars[,,t] <- apply(((1-Smats[,,t])^Qs[,,t]),1,prod)
  r_stars[,,t] <- Gmats[,,t]/(1-Smats[,,t])
}
Test_versions_sim <- sample(1:5,N,replace = T)

Y_sim = simrRUM(Alphas,r_stars,pi_stars,Qs,test_order,Test_versions_sim)
}