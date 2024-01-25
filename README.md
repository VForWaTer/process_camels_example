# HYRAS example
Example project to reproduce the CAMELS-DE related datasets

## Install

This example is meant to be connected to existing infrastructure. In case you want to run it locally,
here is what you need to do:


The docker compose can be used to setup all the necessary strucutre.

```
docker compose up -d
```

This will install a postgres/postgis database and use the data/pg_data folder as a volume for the database.
You need to install that folder by hand, as it has to be empty to work properly.

The `installer` service will mount the `init` folder and run the shell script in there. That will 
download hyras precipitation data, download the vforwater/scripts repository and run the upload scripts
for hyras inside the installer container.

With that in place, you are ready to run the actual tool

## Generate input files

