/* Table: issues__transitions */
/* Parent: { parent }} */
{{
    config(
        materialized='view'
    )
}}
-- depends_on: {{ ref('dlt_active_load_ids') }}
-- depends_on: {{ ref('stg_issues') }}

SELECT
/* select which columns will be available for table 'issues__transitions' */
    id,
    name,
    to__self,
    to__description,
    to__icon_url,
    to__name,
    to__id,
    to__status_category,
    has_screen,
    is_global,
    is_initial,
    is_available,
    is_conditional,
    is_looped,
    _dlt_parent_id,
    _dlt_list_idx,
    _dlt_id,
FROM {{ source('raw_data', 'issues__transitions') }}

/* we only load table items if the parent table has the parent item */
WHERE _dlt_parent_id IN ( SELECT _dlt_id FROM {{ ref('stg_issues') }} )
