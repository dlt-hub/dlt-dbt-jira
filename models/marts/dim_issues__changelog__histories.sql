/* Table: issues__changelog__histories */
/* Parent: issues */
{{
    config(
        materialized='incremental'
    )
}}
SELECT
    t.id,
    t.author__self,
    t.author__account_id,
    t.author__email_address,
    t.author__avatar_urls,
    t.author__display_name,
    t.author__active,
    t.author__time_zone,
    t.author__account_type,
    t.created,
    t._dlt_parent_id,
    t._dlt_list_idx,
    t._dlt_id,
FROM  {{ ref('stg_issues__changelog__histories') }} as t
/* this join to the parent table is not necessarily needed for this template to work */
JOIN {{ ref('stg_issues') }} as pt
ON (t._dlt_parent_id = pt._dlt_id)