/* Table: issues__changelog__histories__items */
/* Parent: issues__changelog__histories */
{{
    config(
        materialized='incremental'
    )
}}
SELECT
    t.field,
    t.fieldtype,
    t.field_id,
    t.to,
    t.to_string,
    t._dlt_parent_id,
    t._dlt_list_idx,
    t._dlt_id,
    t.to_string__v_text,
    t.from,
    t.from_string,
FROM  {{ ref('stg_issues__changelog__histories__items') }} as t
/* this join to the parent table is not necessarily needed for this template to work */
JOIN {{ ref('stg_issues__changelog__histories') }} as pt
ON (t._dlt_parent_id = pt._dlt_id)