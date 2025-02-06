/* Table: issues__operations__link_groups__groups */
/* Parent: issues__operations__link_groups */
{{
    config(
        materialized='incremental'
    )
}}
SELECT
    t.id,
    t.weight,
    t.links,
    t.groups,
    t._dlt_parent_id,
    t._dlt_list_idx,
    t._dlt_id,
    t.header,
FROM  {{ ref('stg_issues__operations__link_groups__groups') }} as t
/* this join to the parent table is not necessarily needed for this template to work */
JOIN {{ ref('stg_issues__operations__link_groups') }} as pt
ON (t._dlt_parent_id = pt._dlt_id)