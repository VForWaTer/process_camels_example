#!/bin/bash

# create a new directory for the hyras example
mkdir -p /hyras_cache
cd /hyras_cache

# download the hyras Precipitation for the given years
mkdir -p /hyras_cache/Precipitation
cd /hyras_cache/Precipitation
for year in {1980..1990}
do
    wget https://opendata.dwd.de/climate_environment/CDC/grids_germany/daily/hyras_de/precipitation/pr_hyras_1_${year}_v5-0_de.nc
done

# copy to the output data directory of metacatalog
mkdir -p ${DATA_FILE_PATH}/Precipitation
cp /hyras_cache/Precipitation/* ${DATA_FILE_PATH}/Precipitation

# download the scripts directory
cd /hyras_cache
git clone https://github.com/vforwater/scripts.git
cd scripts/

# install papermill and jupyter to run the examples
pip install papermill jupyter

# run the hyras example to import the downloaded data to the metacatalog instance
papermill /hyras_cache/scripts/hyras/upload_hyras.ipynb ${DATA_FILE_PATH}/upload_hyras.ipynb -p DATA_DIR $DATA_FILE_PATH -p CONNECTION $METACATALOG_URI
