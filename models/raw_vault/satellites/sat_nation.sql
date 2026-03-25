{{
  config(
    meta={
      'is_auto_end_dating': true
    }
  )
}}

{{ automate_dv.eff_sat(
    src_pk='nation_hk',
    src_dfk='nation_hk',
    src_sfk='nation_hk',
    src_extra_columns=['n_name', 'n_comment'],
    src_start_date='effective_from',
    src_end_date='effective_to',
    src_eff='effective_from',
    src_ldts='load_datetime',
    src_source='record_source',
    source_model='stg_nation'
) }}
