# Open Source Modern Data Stack
This repo demonstrate a comprehensive modern data stack using popular open-source tools.

Welcome to Open Source Modern Data Stack (OSMDS). This repo showcases a complete modern data stack using popular open-source tools.

![osmds_architeture.png](images%2Fosmds_architeture.png)
# Components of the OSMDS
Before we set up project, let's briefly look at each tools used in this example of the open source modern data stack to make sure you understand their components.

# Airbyte
Airbyte is an open-source data integration tool. With Airbyte, you can set up a data pipeline in minutes thanks to its extensive collection of pre-built connectors. Airbyte can replicate data from applications, APIs, and databases into data warehouses and data lakes. Airbyte offers a self-hosted option with Docker Compose that you can run locally. In this example, Airbyte is used to replicate data from a CSV file to Apache Doris.

# Apache Doris
Apache Doris is a high-performance, real-time analytic database base on the MPP (Massive Parralell Processing) architecture and is known for extreme speed and ease of use. It takes only sub-second response time to return query results under massive amounts of data, can support not only highly concurrent point query scenarios, but also high throughput complex analytic scenarios.

# DBT
dbt is an open-source data transformation tool that relies on SQL to build production-grade data pipelines. dbt replaces the usual boilerplate DDL/DML required to transform data with simple modular SQL SELECT statements and handles dependency management. dbt provides a cloud-hosted option and a CLI, a Python API and integration with orchestration tools like Apache Airflow, Dagter, etc. In this OSMDS example, dbt a simple transformation on the ingested data using a SQL query. Airbyte's native integration with dbt is used to run the transformations.

# Apache Superset
Apache Superset is a modern business intelligence, data exploration and visualization platform. Superset connects with a variety of databases and provides an intuitive interface for visualizing datasets. It offers a wide choice of visualizations as well as a no-code visualization builder. You can run Superset locally with Docker Compose or in the cloud using Preset. Superset sits at the end of this real time data analytics stack example and is used to visualize the data stored in Apache Doris.

# Pre-requisites
To follow along, you need to:

**Install Docker and Docker Compose in your machine**. You can follow [this guide](https://docs.docker.com/engine/install/?_gl=1*187dp4*_ga*MTAzNDgyNDI0My4xNjkzNDY2NDcy) to install Docker and [this one](https://docs.docker.com/compose/install/?_gl=1*187dp4*_ga*MTAzNDgyNDI0My4xNjkzNDY2NDcy) to install Docker Compose.

# Using Docker Compose to bootstrap OSMDS
This tutorial uses Docker Compose and a shell script to set up the required resources. Docker saves you from installing additional dependencies locall. You can quickly start and stop the instances.

The shell script **setup.sh** provides two commands, *up* and *down*, to start and stop the instances. The compose files are stored in *airbyte/docker-compose-airbyte.yaml*, *doris/docker-compose-doris.yaml*, and *superset/docker-compose-superset.yaml*. You can go through these files and make any necessary customization, for example, changing the ports where the instances start or installing additional dependencies.

## Setting up Airbyte, Doris, Superset with Docker Compose
### Setting up Airbyte
The script launches the Airbyte instance at *http://localhost:8000*. In this tutorial, you will use the File source to read a CSV file. Enter Covid 19 data as the source name, and select File as the source type. Make sure csv is chosen as the format and paste the following URL in the url field: *https://storage.googleapis.com/covid19-open-data/v2/latest/epidemiology.csv*. Finally, enter the name of the dataset you created in Doris.

*Note: Here we use the Doris built-in default user (airbyte) and default password (password) to log.*
#### Configuring data source
<p align="center">
    <img src="images/airbyte_source_configuration.png" width="800"/>
</p>
#### Configuring data destination


### Setting up Doris
The script launches the Doris FE (front end) instance at *http://localhost:8030*. You can see the following screen, which indicates that the FE has start successfully.
![doris_fe_login.png](images%2Fdoris_fe_login.png)
*Note: Here we use the Doris built-in default user (root) to log in with an empty password.*


### Setting up Superset
Once the setup.sh command has completed, visit *http://localhost:8088* to access the Superset UI. Enter admin as username and password. Choose MySQL (use to connect to Doris DWH) from the supported databases drop-down. Then upload the service account keyfile.
<p align="center">
    <img src="images/superset_doris_connection.png" width="600"/>
</p>
# Using the OSDMS
One the stack is ready and running. You can start using it to ingest and process your data.

## Sync data from CSV into Doris using Airbyte

## Do a simple transformation with the dbt

## Visualize data on dashboard with Superset

## Cleaning up

# Conclusion

# About the author

# Thanks

