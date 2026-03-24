{{
  config(
    meta={
      'is_auto_end_dating': true
    }
  )
}}

{{ automate_dv.eff_sat(
    src_pk='supplier_nation_lk',
    src_dfk='supplier_hk',
    src_sfk='nation_hk',
    src_extra_columns=['s_name', 's_address', 's_phone', 's_acctbal', 's_comment'],
    src_start_date='effective_from',
    src_end_date='effective_to',
    src_eff='effective_from',
    src_ldts='load_datetime',
    src_source='record_source',
    source_model='stg_supplier'
) }}
