{{config(
    materialized='table',
    properties= {"replication_allocation" : "tag.location.default: 1"}
)}}

SELECT
    `date`,
    sum(total_tested) total_tested,
    sum(new_recovered) new_recovered,
    sum(new_deceased) new_deceased,
    sum(total_confirmed) total_confirmed,
    sum(new_tested) new_tested,
    sum(total_recovered) total_recovered,
    sum(new_confirmed) new_confirmed,
    sum(total_deceased) total_deceased
FROM {{ ref('stg_covid19_data') }}
GROUP BY 1
