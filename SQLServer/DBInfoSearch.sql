SELECT DBname, Catalog_name, Catalog_values
FROM (
  SELECT cast(name collate database_default as nvarchar(max)) as DBname
   , cast(database_id as nvarchar(max)) as database_id
   , cast(source_database_id as nvarchar(max)) as source_database_id
   , cast(owner_sid as nvarchar(max)) as owner_sid
   , cast(create_date as nvarchar(max)) as create_date
   , cast(compatibility_level as nvarchar(max)) as compatibility_level
   , cast(collation_name collate database_default as nvarchar(max)) as collation_name
   , cast(user_access as nvarchar(max)) as user_access
   , cast(user_access_desc  collate database_default as nvarchar(max)) as user_access_desc
   , cast(is_read_only as nvarchar(max)) as is_read_only
   , cast(is_auto_close_on as nvarchar(max)) as is_auto_close_on
   , cast(is_auto_shrink_on as nvarchar(max)) as is_auto_shrink_on
   , cast(state as nvarchar(max)) as state
   , cast(state_desc collate database_default as nvarchar(max)) as state_desc
   , cast(is_in_standby as nvarchar(max)) as is_in_standby
   , cast(is_cleanly_shutdown as nvarchar(max)) as is_cleanly_shutdown
   , cast(is_supplemental_logging_enabled as nvarchar(max)) as is_supplemental_logging_enabled
   , cast(snapshot_isolation_state as nvarchar(max)) as snapshot_isolation_state
   , cast(snapshot_isolation_state_desc collate database_default as nvarchar(max)) as snapshot_isolation_state_desc
   , cast(is_read_committed_snapshot_on as nvarchar(max)) as is_read_committed_snapshot_on
   , cast(recovery_model as nvarchar(max)) as recovery_model
   , cast(recovery_model_desc collate database_default as nvarchar(max)) as recovery_model_desc
   , cast(page_verify_option as nvarchar(max)) as page_verify_option
   , cast(page_verify_option_desc collate database_default as nvarchar(max)) as page_verify_option_desc
   , cast(is_auto_create_stats_on as nvarchar(max)) as is_auto_create_stats_on
   , cast(is_auto_create_stats_incremental_on as nvarchar(max)) as is_auto_create_stats_incremental_on
   , cast(is_auto_update_stats_on as nvarchar(max)) as is_auto_update_stats_on
   , cast(is_auto_update_stats_async_on as nvarchar(max)) as is_auto_update_stats_async_on
   , cast(is_ansi_null_default_on as nvarchar(max)) as is_ansi_null_default_on
   , cast(is_ansi_nulls_on as nvarchar(max)) as is_ansi_nulls_on
   , cast(is_ansi_padding_on as nvarchar(max)) as is_ansi_padding_on
   , cast(is_ansi_warnings_on as nvarchar(max)) as is_ansi_warnings_on
   , cast(is_arithabort_on as nvarchar(max)) as is_arithabort_on
   , cast(is_concat_null_yields_null_on as nvarchar(max)) as is_concat_null_yields_null_on
   , cast(is_numeric_roundabort_on as nvarchar(max)) as is_numeric_roundabort_on
   , cast(is_quoted_identifier_on as nvarchar(max)) as is_quoted_identifier_on
   , cast(is_recursive_triggers_on as nvarchar(max)) as is_recursive_triggers_on
   , cast(is_cursor_close_on_commit_on as nvarchar(max)) as is_cursor_close_on_commit_on
   , cast(is_local_cursor_default as nvarchar(max)) as is_local_cursor_default
   , cast(is_fulltext_enabled as nvarchar(max)) as is_fulltext_enabled
   , cast(is_trustworthy_on as nvarchar(max)) as is_trustworthy_on
   , cast(is_db_chaining_on as nvarchar(max)) as is_db_chaining_on
   , cast(is_parameterization_forced as nvarchar(max)) as is_parameterization_forced
   , cast(is_master_key_encrypted_by_server as nvarchar(max)) as is_master_key_encrypted_by_server
   , cast(is_query_store_on as nvarchar(max)) as is_query_store_on
   , cast(is_published as nvarchar(max)) as is_published
   , cast(is_subscribed as nvarchar(max)) as is_subscribed
   , cast(is_merge_published as nvarchar(max)) as is_merge_published
   , cast(is_distributor as nvarchar(max)) as is_distributor
   , cast(is_sync_with_backup as nvarchar(max)) as is_sync_with_backup
   , cast(service_broker_guid as nvarchar(max)) as service_broker_guid
   , cast(is_broker_enabled as nvarchar(max)) as is_broker_enabled
   , cast(log_reuse_wait as nvarchar(max)) as log_reuse_wait
   , cast(log_reuse_wait_desc collate database_default as nvarchar(max)) as log_reuse_wait_desc
   , cast(is_date_correlation_on as nvarchar(max)) as is_date_correlation_on
   , cast(is_cdc_enabled as nvarchar(max)) as is_cdc_enabled
   , cast(is_encrypted as nvarchar(max)) as is_encrypted
   , cast(is_honor_broker_priority_on as nvarchar(max)) as is_honor_broker_priority_on
   , cast(replica_id as nvarchar(max)) as replica_id
   , cast(group_database_id as nvarchar(max)) as group_database_id
   , cast(resource_pool_id as nvarchar(max)) as resource_pool_id
   , cast(default_language_lcid as nvarchar(max)) as default_language_lcid
   , cast(default_language_name collate database_default as nvarchar(max)) as default_language_name
   , cast(default_fulltext_language_lcid as nvarchar(max)) as default_fulltext_language_lcid
   , cast(default_fulltext_language_name collate database_default as nvarchar(max)) as default_fulltext_language_name
   , cast(is_nested_triggers_on as nvarchar(max)) as is_nested_triggers_on
   , cast(is_transform_noise_words_on as nvarchar(max)) as is_transform_noise_words_on
   , cast(two_digit_year_cutoff as nvarchar(max)) as two_digit_year_cutoff
   , cast(containment as nvarchar(max)) as containment
   , cast(containment_desc collate database_default as nvarchar(max)) as containment_desc
   , cast(target_recovery_time_in_seconds as nvarchar(max)) as target_recovery_time_in_seconds
   , cast(delayed_durability as nvarchar(max)) as delayed_durability
   , cast(delayed_durability_desc collate database_default as nvarchar(max)) as delayed_durability_desc
   , cast(is_memory_optimized_elevate_to_snapshot_on as nvarchar(max)) as is_memory_optimized_elevate_to_snapshot_on
   , cast(is_federation_member as nvarchar(max)) as is_federation_member
   , cast(is_remote_data_archive_enabled as nvarchar(max)) as is_remote_data_archive_enabled
   , cast(is_mixed_page_allocation_on as nvarchar(max)) as is_mixed_page_allocation_on
   , cast(is_temporal_history_retention_enabled as nvarchar(max)) as is_temporal_history_retention_enabled
   , cast(catalog_collation_type as nvarchar(max)) as catalog_collation_type
   , cast(catalog_collation_type_desc collate database_default as nvarchar(max)) as catalog_collation_type_desc
   , cast(physical_database_name collate database_default as nvarchar(max)) as physical_database_name
   , cast(is_result_set_caching_on as nvarchar(max)) as is_result_set_caching_on
   , cast(is_accelerated_database_recovery_on as nvarchar(max)) as is_accelerated_database_recovery_on
   , cast(is_tempdb_spill_to_remote_store as nvarchar(max)) as is_tempdb_spill_to_remote_store
   , cast(is_stale_page_detection_on as nvarchar(max)) as is_stale_page_detection_on
   , cast(is_memory_optimized_enabled as nvarchar(max)) as is_memory_optimized_enabled 
  FROM sys.databases
) AS T
UNPIVOT (
  Catalog_values 
  FOR Catalog_name IN (database_id, source_database_id, owner_sid, create_date, compatibility_level
   , collation_name, user_access, user_access_desc, is_read_only, is_auto_close_on, is_auto_shrink_on
   , state, state_desc, is_in_standby, is_cleanly_shutdown, is_supplemental_logging_enabled
   , snapshot_isolation_state, snapshot_isolation_state_desc, is_read_committed_snapshot_on, recovery_model
   , recovery_model_desc, page_verify_option, page_verify_option_desc, is_auto_create_stats_on
   , is_auto_create_stats_incremental_on, is_auto_update_stats_on, is_auto_update_stats_async_on
   , is_ansi_null_default_on, is_ansi_nulls_on, is_ansi_padding_on, is_ansi_warnings_on, is_arithabort_on
   , is_concat_null_yields_null_on, is_numeric_roundabort_on, is_quoted_identifier_on
   , is_recursive_triggers_on, is_cursor_close_on_commit_on, is_local_cursor_default, is_fulltext_enabled
   , is_trustworthy_on, is_db_chaining_on, is_parameterization_forced, is_master_key_encrypted_by_server
   , is_query_store_on, is_published, is_subscribed, is_merge_published, is_distributor
   , is_sync_with_backup, service_broker_guid, is_broker_enabled, log_reuse_wait, log_reuse_wait_desc
   , is_date_correlation_on, is_cdc_enabled, is_encrypted, is_honor_broker_priority_on
   , replica_id, group_database_id, resource_pool_id, default_language_lcid, default_language_name
   , default_fulltext_language_lcid, default_fulltext_language_name, is_nested_triggers_on
   , is_transform_noise_words_on, two_digit_year_cutoff, containment, containment_desc
   , target_recovery_time_in_seconds, delayed_durability, delayed_durability_desc
   , is_memory_optimized_elevate_to_snapshot_on, is_federation_member, is_remote_data_archive_enabled
   , is_mixed_page_allocation_on, is_temporal_history_retention_enabled, catalog_collation_type
   , catalog_collation_type_desc, physical_database_name, is_result_set_caching_on
   , is_accelerated_database_recovery_on, is_tempdb_spill_to_remote_store, is_stale_page_detection_on
   , is_memory_optimized_enabled)
) AS UT  
 WHERE DBname='<DB명>' AND Catalog_name like '%<관련 OPTION 정보>%'

