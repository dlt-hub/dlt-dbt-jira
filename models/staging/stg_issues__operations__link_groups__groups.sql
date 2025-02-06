/* Table: issues__operations__link_groups__groups */
/* Parent: { parent }} */
{{
    config(
        materialized='view'
    )
}}
-- depends_on: {{ ref('dlt_active_load_ids') }}
-- depends_on: {{ ref('stg_issues__operations__link_groups') }}

SELECT
/* select which columns will be available for table 'issues__operations__link_groups__groups' */
    id,
    weight,
    links,
    groups,
    _dlt_parent_id,
    _dlt_list_idx,
    _dlt_id,
    header,
FROM {{ source('raw_data', 'issues__operations__link_groups__groups') }}

/* we only load table items if the parent table has the parent item */
WHERE _dlt_parent_id IN ( SELECT _dlt_id FROM {{ ref('stg_issues__operations__link_groups') }} )
