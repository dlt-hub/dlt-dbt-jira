/* Table: projects */
{{
    config(
        materialized='view'
    )
}}
-- depends_on: {{ ref('dlt_active_load_ids') }}

SELECT
/* select which columns will be available for table 'projects' */
    expand,
    self,
    id,
    key,
    description,
    lead__self,
    lead__account_id,
    lead__account_type,
    lead__avatar_urls___48x48,
    lead__avatar_urls___24x24,
    lead__avatar_urls___16x16,
    lead__avatar_urls___32x32,
    lead__display_name,
    lead__active,
    name,
    avatar_urls___48x48,
    avatar_urls___24x24,
    avatar_urls___16x16,
    avatar_urls___32x32,
    project_type_key,
    simplified,
    style,
    is_private,
    permissions__can_edit,
    entity_id,
    uuid,
    insight__total_issue_count,
    insight__last_issue_update_time,
    _dlt_load_id,
    _dlt_id,
FROM {{ source('raw_data', 'projects') }}

/* we only load table items of the currently active load ids into the staging table */
WHERE _dlt_load_id IN ( SELECT load_id FROM  {{ ref('dlt_active_load_ids') }} )