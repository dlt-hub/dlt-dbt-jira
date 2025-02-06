/* Table: issues__changelog__histories__items */
/* Parent: { parent }} */
{{
    config(
        materialized='view'
    )
}}
-- depends_on: {{ ref('dlt_active_load_ids') }}
-- depends_on: {{ ref('stg_issues__changelog__histories') }}

SELECT
/* select which columns will be available for table 'issues__changelog__histories__items' */
    field,
    fieldtype,
    field_id,
    to,
    to_string,
    _dlt_parent_id,
    _dlt_list_idx,
    _dlt_id,
    to_string__v_text,
    from,
    from_string,
FROM {{ source('raw_data', 'issues__changelog__histories__items') }}

/* we only load table items if the parent table has the parent item */
WHERE _dlt_parent_id IN ( SELECT _dlt_id FROM {{ ref('stg_issues__changelog__histories') }} )
