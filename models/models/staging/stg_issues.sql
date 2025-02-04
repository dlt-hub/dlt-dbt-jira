/* Table: issues */
{{
    config(
        materialized='view'
    )
}}
-- depends_on: {{ ref('dlt_active_load_ids') }}

SELECT
/* select which columns will be available for table 'issues' */
    expand,
    id,
    self,
    key,
    changelog__start_at,
    changelog__max_results,
    changelog__total,
    fields__statuscategorychangedate,
    fields__issuetype__self,
    fields__issuetype__id,
    fields__issuetype__description,
    fields__issuetype__icon_url,
    fields__issuetype__name,
    fields__issuetype__subtask,
    fields__issuetype__avatar_id,
    fields__issuetype__entity_id,
    fields__issuetype__hierarchy_level,
    fields__project__self,
    fields__project__id,
    fields__project__key,
    fields__project__name,
    fields__project__project_type_key,
    fields__project__simplified,
    fields__project__avatar_urls,
    fields__workratio,
    fields__issuerestriction__issuerestrictions,
    fields__issuerestriction__should_display,
    fields__watches__self,
    fields__watches__watch_count,
    fields__watches__is_watching,
    fields__created,
    fields__priority__self,
    fields__priority__icon_url,
    fields__priority__name,
    fields__priority__id,
    fields__customfield_10018__has_epic_link_field_dependency,
    fields__customfield_10018__show_field,
    fields__customfield_10018__non_editable_reason,
    fields__customfield_10019,
    fields__updated,
    fields__status__self,
    fields__status__description,
    fields__status__icon_url,
    fields__status__name,
    fields__status__id,
    fields__status__status_category,
    fields__summary,
    fields__creator__self,
    fields__creator__account_id,
    fields__creator__email_address,
    fields__creator__avatar_urls,
    fields__creator__display_name,
    fields__creator__active,
    fields__creator__time_zone,
    fields__creator__account_type,
    fields__reporter__self,
    fields__reporter__account_id,
    fields__reporter__email_address,
    fields__reporter__avatar_urls,
    fields__reporter__display_name,
    fields__reporter__active,
    fields__reporter__time_zone,
    fields__reporter__account_type,
    fields__aggregateprogress__progress,
    fields__aggregateprogress__total,
    fields__progress__progress,
    fields__progress__total,
    fields__comment__comments,
    fields__comment__self,
    fields__comment__max_results,
    fields__comment__total,
    fields__comment__start_at,
    fields__votes__self,
    fields__votes__votes,
    fields__votes__has_voted,
    fields__worklog__start_at,
    fields__worklog__max_results,
    fields__worklog__total,
    fields__worklog__worklogs,
    _dlt_load_id,
    _dlt_id,
    fields__parent__id,
    fields__parent__key,
    fields__parent__self,
    fields__parent__fields,
    fields__resolution__self,
    fields__resolution__id,
    fields__resolution__description,
    fields__resolution__name,
    fields__customfield_10027,
    fields__resolutiondate,
    fields__last_viewed,
    fields__customfield_10017,
    fields__customfield_10015,
    fields__duedate,
    fields__description__type,
    fields__description__version,
    fields__description__content,
FROM {{ source('raw_data', 'issues') }}

/* we only load table items of the currently active load ids into the staging table */
WHERE _dlt_load_id IN ( SELECT load_id FROM  {{ ref('dlt_active_load_ids') }} )