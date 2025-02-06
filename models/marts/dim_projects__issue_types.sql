/* Table: projects__issue_types */
/* Parent: projects */
{{
    config(
        materialized='incremental'
    )
}}
SELECT
    t.self,
    t.id,
    t.description,
    t.icon_url,
    t.name,
    t.subtask,
    t.avatar_id,
    t.hierarchy_level,
    t._dlt_parent_id,
    t._dlt_list_idx,
    t._dlt_id,
FROM  {{ ref('stg_projects__issue_types') }} as t
/* this join to the parent table is not necessarily needed for this template to work */
JOIN {{ ref('stg_projects') }} as pt
ON (t._dlt_parent_id = pt._dlt_id)