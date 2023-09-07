{{config(
    materialized='table',
    distributed_by = [],
    properties= {"replication_allocation" : "tag.location.default: 1"}
)}}

with tmp_tbl as (
    SELECT replace(_airbyte_data, '\\', '') _airbyte_data
	FROM {{ source('doris_covid19_data', 'covid19_data') }}
)

SELECT
    get_json_string(_airbyte_data, '$.key') `key`
    , get_json_double(_airbyte_data, '$.total_tested') total_tested
    , get_json_double(_airbyte_data, '$.new_recovered') new_recovered
    , get_json_double(_airbyte_data, '$.new_deceased') new_deceased
    , get_json_string(_airbyte_data, '$.date') `date`
    , get_json_double(_airbyte_data, '$.total_confirmed') total_confirmed
    , get_json_double(_airbyte_data, '$.new_tested') new_tested
    , get_json_double(_airbyte_data, '$.total_recovered') total_recovered
    , get_json_double(_airbyte_data, '$.new_confirmed') new_confirmed
    , get_json_double(_airbyte_data, '$.total_deceased') total_deceased
FROM tmp_tbl
