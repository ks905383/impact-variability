# impact-variability

## Summary
Projections of the impact of cliamte change on socioeconomic variables such as mortality, agricultural yields, etc., routinely discount the uncertainty contributed by internal climate model variability. Using 50 runs of a newly-released "large ensemble" that samples internal model variability, projections of heat-related mortality in the United States will be calculated using a well-known heat-mortality "damage function" to get a back-of-the-envelope estimate of this uncertainty.  

## (Longer) Description
Studies that project the impact of climate change on socioeconometric variables (mortality, agricultural yields, etc.) frequently do not fully account for uncertainty in their climate inputs (see for example [Auffhammer et al. 2013](https://academic.oup.com/reep/article-abstract/7/2/181/1522753?redirectedFrom=fulltext) for a discussion of common pitfalls when using climate data for socioeconomic studies). Standard procedure in many climate econometric projections involves using single climate model runs to construct projections of the future climate distribution (often using some form of bias correction), and applying changes from the present to these projections to the "damage functions" (functions that related some change in a climate variable to some change in a socioeconomic variable). Though more recent studies tend to more accurately model the uncertainty provided by *inter*-model variability (by, e.g., providing estimates for projections calculated from all models across the CMIP5 archive), little discussion has adressed the uncertainty provided by *internal* model variability, which can be significant over early- to mid-century timescales ([Deser et al., 2010](https://link.springer.com/article/10.1007/s00382-010-0977-x), [Hawkins and Sutton, 2009](https://journals.ametsoc.org/doi/abs/10.1175/2009BAMS2607.1)). 

Until recently, accurately estimating internal model variability was complicated by the high computational cost of running climate models, thereby preventing the widespread creation of millennial-scale equilibrated runs or multiple-initial-condition ensembles. However, recent advances in computing have made both feasible, as can be seen through the [Large Ensemble Archive](http://www.cesm.ucar.edu/projects/community-projects/MMLEA/) or the [Long-Run Model Intercomparison Project (LongRunMIP)](http://www.longrunmip.org). 

This project aims to provide a rough 'back-of-the-envelope' estimation of the added uncertainty in heat-related mortality projections for the United States caused by the interal variability in MPI-ESM, a CMIP5/6-generation model commonly used in impacts projections, but which has also been run 100 times with slight variations in initial conditions as part of the "MPI Grand Ensemble" ([MPI-GE](https://www.mpimet.mpg.de/en/grand-ensemble/); see also [Maher et al. 2019](https://agupubs.onlinelibrary.wiley.com/doi/full/10.1029/2019MS001639)). 

Since damage functions tend to be non-linear and internal model variability tends to vary spatiotemporally, _a priori_ estimates of the magnitude of this uncertainty are hard to construct and generalize, and therefore a brute-force computational approach may be the most suited. 

By running a well-known econometrically-derived estimate of the relationship between binned temperature and mortality rates in counties in the continental US (a 'damage function' from [Deschenes and Greenstone, 2011](https://www.aeaweb.org/articles?id=10.1257/app.3.4.152)) with end-of-century temperature projections from each of the 100 runs in the MPI-GE, the uncertainty caused by internal variability in the MPI-GE on the estimated change in heat-related mortality rates in the US will be estimated. Combined with recent census population estimates, these changes in rates can be used to estimate absolute mortality changes as well. 

Future projections will be created by adding the change in monthly average temperature in each MPI-GE run to each month in a historical weather dataset (a "Delta-Method" bias correction, which assumes that changes in a model are less biased than levels); in other words, "January 2080" is constructed by taking all days in January 1980 and adding the mean change in Januaries ([2080-2099] - [1980-1999]). 

These estimates are not intended to provide accurate projections of future mortality, since this simple calculation does not take into account changes in wealth, population, migration, adaptation technology etc. (not to mention inter-model differences in internal variability or regional differences in the damage function), but rather offers an order-of-magnitude estimate of unaccounted uncertainty caused by internal model variability. Furthermore, this approach mirrors many climate econometric studies that construct projections under these same assumptions (including Deschenes and Greenstone, 2011 - the paper whose results will be adapted in this project). In this regard, this project does not comment on the suitability of the common projection approach mentioned above, but merely showcases how implicit sources of uncertainty in this method may be underestimated. 

## Research Design
1. Download relevant data (detailed below), subset to continental USA to save space
2. Regrid weather data to MPI-GE grid
3. Construct projection for each MPI-GE pixel and run by adding MPI-GE month-by-month average changes (within a run) to weather data 
4. Construct pixel-wise estimates for changes in mortality rate by applying changes in bin-days in the projected/historical data from each run to the heat-mortality damage function
5. Calculate measure of dispersion (std/iqr) across runs to get an order-of-magnitude estimate for the uncertainty caused by internal variability
6. (Aggregate changes in mortality rate to the county level; combine with population records to get the same metric for changes in total mortality by county)
7. Make diagnostic maps of the above e.g. - changes in bin-days per pixel (sample of some of the individual MPI-GE runs), spread across pixels of bin-days / runs, changes in mortality rate, changes in total mortality) + some diagnostic plots (example of calculation; etc.)


## Data
* Weather data: ERA-INTERIM (ERA-5 is better; but also higher-resolution than necessary for this project): https://apps.ecmwf.int/datasets/data/interim-full-daily/levtype=sfc/
* Climate data: MPI-GE, https://esgf-data.dkrz.de/search/mpi-ge/
	* Monthly temperature data, historical (1980-1999) and RCP8.5 (2080-2099)
	* (might limit to 50 runs for reasons of storage space)
* Damage function: derived from the replication code for Figure 2 of Deschenes and Greenstone 2011, for temperature-caused county-level mortality rates in the US, https://www.aeaweb.org/articles?id=10.1257/app.3.4.152
* County-level population data: from US Census, https://www.census.gov/data/tables/time-series/demo/popest/2010s-counties-total.html 

