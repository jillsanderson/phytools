\name{fitMk}
\alias{fitMk}
\alias{plot.fitMk}
\alias{plot.gfit}
\alias{fitmultiMk}
\alias{fitpolyMk}
\alias{plot.fitpolyMk}
\alias{mcmcMk}
\alias{plot.mcmcMk}
\alias{density.mcmcMk}
\alias{plot.density.mcmcMk}
\alias{logLik.gfit}
\title{Fits Mk model}
\usage{
fitMk(tree, x, model="SYM", fixedQ=NULL, ...)
\method{plot}{fitMk}(x, ...)
\method{plot}{gfit}(x, ...)
fitmultiMk(tree, x, model="ER", ...)
fitpolyMk(tree, x, model="SYM", ordered=FALSE, ...)
\method{plot}{fitpolyMk}(x, ...)
mcmcMk(tree, x, model="ER", ngen=10000, ...)
\method{plot}{mcmcMk}(x, ...)
\method{density}{mcmcMk}(x, ...)
\method{plot}{density.mcmcMk}(x, ...)
\method{logLik}{gfit}(object, ...)
}
\arguments{
	\item{tree}{an object of class \code{"phylo"}. In the case of \code{fitmultiMk} an object of class \code{"simmap"} with a mapped discrete character.}
	\item{x}{a vector of tip values for species; \code{names(x)} should be the species names. In the case of \code{plot} and \code{density} methods, an object of the appropriate class.}
	\item{model}{model. See \code{make.simmap} or \code{ace} for details.}
	\item{fixedQ}{fixed value of transition matrix \code{Q}, if one is desired.}
	\item{ordered}{for \code{fitpolyMk}, a logical value indicating whether or not the character should be treated as ordered. For now the function assumes alphanumerical order (i.e., numbers sorted by their initial and then successive digits followed by characters or character strings in alphabetical order).}
	\item{ngen}{number of generations of MCMC for \code{mcmcMk}.}
	\item{...}{optional arguments, including \code{pi}, the prior distribution at the root node (defaults to \code{pi="equal"}). For \code{plot} method optional arguments include (but may not be limited to): \code{signif}, the number of digits for the rates to be plotted; \code{main}, a character vector of length two with the headings for each subplot; \code{cex.main}, \code{cex.traits}, and \code{cex.rates}, font sizes for the various text elements of the plot; and \code{show.zeros}, a logical argument specifying whether or not to plot arrows with the ML estimated transition rate is not different from zero (with tolerance specified by the optional argument \code{tol}).}
	\item{object}{for \code{logLik.gfit}, object of class \code{"gfit"}.}
}
\description{
	The function \code{fitMk} fits a so-called M\emph{k} model for discrete character evolution.
	
	\code{plot.fitMk} plots an object of class \code{"fitMk"} returned by \code{fitMk}. \code{plot.gfit} plots an object of class \code{"gfit"} from geiger's \code{fitDiscrete} function. Both plots portray the fitted model using a graph of arrows connecting states.
	
	The function \code{fitmultiMk} fits an M\emph{k} model in which the transition rates between character states are allowed to vary depending on the mapped state of a discrete character on the tree. It can be combined with, for example, \code{\link{paintSubTree}} to test hypotheses about how the process of discrete character evolution for \code{x} varies between different parts of the tree.
	
	The function \code{fitpolyMk} fits an M\emph{k} model to data for a discrete character with intraspecific polymorphism. Polymorphic species should be coded with the name of the two or more states recorded for the species separated by a space (e.g., \code{A+B} would indicate that both states \code{A} and \code{B} are found in the corresponding taxon). Invariably it's assumed that transitions between states must occur through a polymorphic condition, whereas transitions \emph{cannot} occur directly between two incompatible polymorphic conditions. For instance, a transition between \code{A+B} and \code{B+C} would have to occur through the monomorphic state \code{B}. At time of writing, this function permits the models \code{"ER"} (equal rates for all permitted transitions), \code{"SYM"} (symmetric backward & forward rates for all permitted transitions), \code{"ARD"} (all-rates-different for permitted transitions), and a new model called \code{"transient"} in which the acquisition of polymorphism (e.g., \code{A -> A+B}) is assumed to occur at a different rate than its loss (e.g., \code{A+B -> B}). The method \code{plot.fitpolyMk} plots the fitted M\emph{k} model with intraspecific polymorphism.
	
	Finally, the function \code{mcmcMk} runs a Bayesian MCMC version of \code{fitMk}. The shape of the prior distribution of the transition rates is exponential, with a rate parameter that can be controlled by the user via the optional argument \code{prior.rate}. The shape of the proposal distribution is normal, with mean zero and a variance that can be controlled by the user via the optional argument \code{prior.var}. The method \code{plot.mcmcMk} plots a log-likelihood trace from the MCMC. The method \code{density.mcmcMk} computes a posterior density on the transition rates in the model from the posterior sample obtained in the MCMC, will import the package \emph{coda} if it is available, and returns an object of class \code{"density.mcmcMk"}. Finally, the method \code{plot.density.mcmcMk} creates a plot of the posterior density (or a set of plots) for the transition rates between states.
}
\details{
	Note that both \code{fitMk} and \code{fitmultiMk} recycle code from \code{\link{ace}} in the \emph{ape} package for computing the likelihood. \code{fitpolyMk} and \code{mcmcMk} use \code{fitMk} internally to compute the likelihood.
}
\value{
	An object of class \code{"fitMk"}, \code{"fitmultiMk"}, \code{"fitpolyMk"}, or \code{"mcmcMk"}. In the case of \code{density.mcmcMk} an object of class \code{"density.mcmcMk"}.
}
\references{
	Revell, L. J. (2012) phytools: An R package for phylogenetic comparative biology (and other things). \emph{Methods Ecol. Evol.}, \bold{3}, 217-223.
}
\author{Liam Revell \email{liam.revell@umb.edu}}
\seealso{
	\code{\link{ace}}, \code{\link{make.simmap}}
}
\keyword{phylogenetics}
\keyword{comparative method}
\keyword{maximum likelihood}
