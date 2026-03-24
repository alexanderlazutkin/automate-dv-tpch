{{
  config(
    meta={
      'is_auto_end_dating': true
    }
  )
}}

{{ automate_dv.eff_sat(
    src_pk='part_hk',
    src_dfk='part_hk',
    src_sfk='part_hk',
    src_extra_columns=['p_name', 'p_mfgr', 'p_brand', 'p_type', 'p_size', 'p_container', 'p_retailprice', 'p_comment'],
    src_start_date='effective_from',
    src_end_date='effective_to',
    src_eff='effective_from',
    src_ldts='load_datetime',
    src_source='record_source',
    source_model='stg_part'
) }}
