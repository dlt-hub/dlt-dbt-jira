/* Table: issues__operations__link_groups__links */
/* Parent: issues__operations__link_groups */
{{
    config(
        materialized='incremental'
    )
}}
SELECT
    t.id,
    t.style_class,
    t.icon_class,
    t.label,
    t.title,
    t.href,
    t.weight,
    t._dlt_parent_id,
    t._dlt_list_idx,
    t._dlt_id,
FROM  {{ ref('stg_issues__operations__link_groups__links') }} as t
/* this join to the parent table is not necessarily needed for this template to work */
JOIN {{ ref('stg_issues__operations__link_groups') }} as pt
ON (t._dlt_parent_id = pt._dlt_id)