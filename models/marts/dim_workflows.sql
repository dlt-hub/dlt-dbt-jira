/* Table: workflows */
{{
    config(
        materialized='incremental'
    )
}}
SELECT
    t.id__name,
    t.id__entity_id,
    t.description,
    t.created,
    t.updated,
    t._dlt_load_id,
    t._dlt_id,
FROM  {{ ref('stg_workflows') }} as t