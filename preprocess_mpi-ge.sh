

## SUBSET HISTORICAL MPI-GE FILES TO 1980-1999 AND CONTINTENTAL NA
# Floating points needed for lat/lon; otherwise it thinks they're indices
# Time indices currently set for 19800101-19991231 for MPI-GE hist files
# with original range of 1850-2005

HIST_FILES=data/tas_Amon_MPI-ESM_historical*.nc

for f in $HIST_FILES
do
	echo $f
	ncea -h -d lat,21.0,56.0 -d lon,232.0,298.0 -F -d time,1561,1800 $f ${f/185001-200512/19800101-19991231_CUSA}
	# remove old, larger file
	rm $f
done

## CONCATENATE SUBSETTED FILES INTO ONE FILE ACROSS RUNS
FN_FINAL=data/tas_Amon_MPI-ESM_historical_RUNS1-50_19800101-19991231_CUSA.nc
ncecat data/tas_Amon_MPI-ESM_historical*19800101-19991231_CUSA.nc $FN_FINAL
# Rename the new dimension "record" as run (with . to not break it if 
# ncecat did indeed just make a dimension, not a variable)
ncrename -h -d record,run -v .record,run $FN_FINAL $FN_FINAL

# Remove constitutent files
rm data/tas_Amon_MPI-ESM_historical_r*


## SUBSET RCP8.5 MPI-GE FILES TO 2080-2099, 2040-2059 AND CONTINENTAL NA
# Time indices currently set for MPI-GE RCP8.5 files with original range
# of 2006-2099
FUT_FILES=data/tas_Amon_MPI-ESM_rcp85*.nc

for f in $FUT_FILES
do
	echo $f
	# for 2040-2059
	ncea -h -d lat,21.0,56.0 -d lon,232.0,298.0 -F -d time,409,648 $f ${f/200601-209912/20400101-20591231_CUSA}
	# for 2080-2099
	ncea -h -d lat,21.0,56.0 -d lon,232.0,298.0 -F -d time,889,1128 $f ${f/200601-209912/20800101-20991231_CUSA}
	# remove old, larger file
	rm $f
done

## CONCATENATE SUBSETTED FILES INTO ONE FILE ACROSS RUNS
FN_FINAL=data/tas_Amon_MPI-ESM_rcp85_RUNS1-50_20400101-20591231_CUSA.nc 
ncecat data/tas_Amon_MPI-ESM_rcp85*20400101-20591231_CUSA.nc $FN_FINAL
# Rename the new dimension "record" as run
ncrename -h -d record,run -v .record,run $FN_FINAL $FN_FINAL

## CONCATENATE SUBSETTED FILES INTO ONE FILE ACROSS RUNS
FN_FINAL=data/tas_Amon_MPI-ESM_rcp85_RUNS1-50_20800101-20991231_CUSA.nc 
ncecat data/tas_Amon_MPI-ESM_rcp85*20800101-20991231_CUSA.nc $FN_FINAL
# Rename the new dimension "record" as run
ncrename -h -d record,run -v .record,run $FN_FINAL $FN_FINAL

# Remove constitutent files
rm data/tas_Amon_MPI-ESM_rcp85_r*
