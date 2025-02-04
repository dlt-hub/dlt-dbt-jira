/* Table: projects */
{{
    config(
        materialized='incremental'
    )
}}
SELECT
    t.expand,
    t.self,
    t.id,
    t.key,
    t.description,
    t.lead__self,
    t.lead__account_id,
    t.lead__account_type,
    t.lead__avatar_urls___48x48,
    t.lead__avatar_urls___24x24,
    t.lead__avatar_urls___16x16,
    t.lead__avatar_urls___32x32,
    t.lead__display_name,
    t.lead__active,
    t.name,
    t.avatar_urls___48x48,
    t.avatar_urls___24x24,
    t.avatar_urls___16x16,
    t.avatar_urls___32x32,
    t.project_type_key,
    t.simplified,
    t.style,
    t.is_private,
    t.permissions__can_edit,
    t.entity_id,
    t.uuid,
    t.insight__total_issue_count,
    t.insight__last_issue_update_time,
    t._dlt_load_id,
    t._dlt_id,
FROM  {{ ref('stg_projects') }} as t