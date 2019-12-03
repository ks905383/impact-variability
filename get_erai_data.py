#!/usr/bin/env python
# This creates one file, about 90 MB
# Takes about 5 minutes
from ecmwfapi import ECMWFDataServer
server = ECMWFDataServer(url="https://api.ecmwf.int/v1",key="d6935832edc961a75ac43136c50f356e",email="kschwarzwald@uchicago.edu")

server.retrieve({
    "class": "ei",
    "dataset": "interim",
    "date": "1980-01-01/to/1999-12-31",
    "expver": "1",
    "grid": "0.75/0.75",
    "area": "51/-125/23/-65",    # North/West/South/East in Geographic lat/long degrees. Southern latitudes and Western longitudes must be given as negative numbers.
    "levtype": "sfc",
    "param": "167.128",
    "step": "12",
    "stream": "oper",
    "time": "00:00:00/12:00:00",
    "type": "fc",
    "format": "netcdf",
    "target": "data/tas_12hr_ERA-INTERIM_historical_reanalysis_19800101-19991231.nc",
})
