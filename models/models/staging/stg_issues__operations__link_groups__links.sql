/* Table: issues__operations__link_groups__links */
/* Parent: { parent }} */
{{
    config(
        materialized='view'
    )
}}
-- depends_on: {{ ref('dlt_active_load_ids') }}
-- depends_on: {{ ref('stg_issues__operations__link_groups') }}

SELECT
/* select which columns will be available for table 'issues__operations__link_groups__links' */
    id,
    style_class,
    icon_class,
    label,
    title,
    href,
    weight,
    _dlt_parent_id,
    _dlt_list_idx,
    _dlt_id,
FROM {{ source('raw_data', 'issues__operations__link_groups__links') }}

/* we only load table items if the parent table has the parent item */
WHERE _dlt_parent_id IN ( SELECT _dlt_id FROM {{ ref('stg_issues__operations__link_groups') }} )
