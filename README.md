# impact-variability


## Summary
Studies that project the impact of climate change on socioeconometric variables (mortality, agricultural yields, etc.) frequently do not fully account for uncertainty in their climate inputs (see for example [Auffhammer et al. 2013](https://academic.oup.com/reep/article-abstract/7/2/181/1522753?redirectedFrom=fulltext) for a discussion of common pitfalls when using climate data for socioeconomic studies). Though more recent studies tend to more accurately model the uncertainty provided by *inter*-model variability, little discussion has adressed the uncertainty provided by *internal* model variability, which can be significant over early- to mid-century timescales ([Deser et al., 2010](https://link.springer.com/article/10.1007/s00382-010-0977-x), [Hawkins and Sutton, 2009](https://journals.ametsoc.org/doi/abs/10.1175/2009BAMS2607.1)). 

Until recently, accurately estimating internal model variability was complicated by the high computational cost of running climate models, thereby preventing the widespread creation of millennial-scale equilibrated runs or multiple-initial-condition ensembles. However, recent advances in computing have made both feasible, as can be seen through the [Large Ensemble Archive](http://www.cesm.ucar.edu/projects/community-projects/MMLEA/) or the [Long-Run Model Intercomparison Project (LongRunMIP)](http://www.longrunmip.org). 

This project aims to provide a rough 'back-of-the-envelope' estimation of the added uncertainty in heat-related mortality projections for the United States caused by the interal variability in MPI-ESM, a CMIP5/6-generation model commonly used in impacts projections, but which has also been run 100 times with slight variations in initial conditions as part of the "MPI Grand Ensemble" ([MPI-GE](https://www.mpimet.mpg.de/en/grand-ensemble/); see also [Maher et al. 2019](https://agupubs.onlinelibrary.wiley.com/doi/full/10.1029/2019MS001639)). 

Since damage functions tend to be non-linear and internal model variability tends to vary spatiotemporally, _a priori_ estimates of the magnitude of this uncertainty are hard to construct and generalize, and therefore a brute-force computational approach may be the most suited. 

By running a well-known econometrically-derived estimate of the relationship between binned temperature and mortality rates in counties in the continental US (a 'damage function' from [Deschenes and Greenstone, 2011](https://www.aeaweb.org/articles?id=10.1257/app.3.4.152)) with end-of-century temperature projections from each of the 100 runs in the MPI-GE, the uncertainty caused by internal variability in the MPI-GE on the estimated change in heat-related mortality rates in the US will be estimated. Combined with recent  

These estimates are not intended to provide accurate projections of future mortality, since this simple calculation does not take into account changes in wealth, population, migration, adaptation technology etc. (not to mention inter-model differences in internal variability), but rather offers an order-of-magnitude estimate of unaccounted uncertainty caused by internal model variability. Furthermore, this approach mirrors many climate econometric studies that construct projections under these same assumptions (including Deschenes and Greenstone, 2011 - the paper whose results will be adapted in this project). 



## Data
* Climate data: MPI-GE, https://esgf-data.dkrz.de/search/mpi-ge/
	* Monthly temperature data, historical (1980-1999) and RCP8.5 (2080-2099)
	* (might limit to 50 runs for reasons of storage space)
* Damage function: derived from the replication code for Figure X of Deschenes and Greenstone 2011, for temperature-caused county-level mortality rates in the US
* County-level population data: from US Census, https://www.census.gov/data/tables/time-series/demo/popest/2010s-counties-total.html 

