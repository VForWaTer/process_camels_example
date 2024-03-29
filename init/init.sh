#!/bin/bash

# download the hyras Precipitation for the given years
mkdir -p ${DATA_FILE_PATH}/Precipitation
cd ${DATA_FILE_PATH}/Precipitation
for (( year=$START_YEAR; year<=$END_YEAR; year++ ))
do
    wget --no-clobber https://opendata.dwd.de/climate_environment/CDC/grids_germany/daily/hyras_de/precipitation/pr_hyras_1_${year}_v5-0_de.nc    
done


# download the scripts directory
cd /tmp
git clone https://github.com/vforwater/scripts.git
cd scripts

# install papermill and jupyter to run the examples
pip install papermill jupyter

# run the hyras example to import the downloaded data to the metacatalog instance
papermill ./hyras/upload_hyras.ipynb ${DATA_FILE_PATH}/upload_hyras.ipynb -p DATA_DIR $DATA_FILE_PATH -p CONNECTION $METACATALOG_URI
