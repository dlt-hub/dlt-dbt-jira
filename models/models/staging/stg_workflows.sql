/* Table: workflows */
{{
    config(
        materialized='view'
    )
}}
-- depends_on: {{ ref('dlt_active_load_ids') }}

SELECT
/* select which columns will be available for table 'workflows' */
    id__name,
    id__entity_id,
    description,
    created,
    updated,
    _dlt_load_id,
    _dlt_id,
FROM {{ source('raw_data', 'workflows') }}

/* we only load table items of the currently active load ids into the staging table */
WHERE _dlt_load_id IN ( SELECT load_id FROM  {{ ref('dlt_active_load_ids') }} )