/* Table: issues__transitions */
/* Parent: issues */
{{
    config(
        materialized='incremental'
    )
}}
SELECT
    t.id,
    t.name,
    t.to__self,
    t.to__description,
    t.to__icon_url,
    t.to__name,
    t.to__id,
    t.to__status_category,
    t.has_screen,
    t.is_global,
    t.is_initial,
    t.is_available,
    t.is_conditional,
    t.is_looped,
    t._dlt_parent_id,
    t._dlt_list_idx,
    t._dlt_id,
FROM  {{ ref('stg_issues__transitions') }} as t
/* this join to the parent table is not necessarily needed for this template to work */
JOIN {{ ref('stg_issues') }} as pt
ON (t._dlt_parent_id = pt._dlt_id)