{{
  config(
    meta={
      'is_auto_end_dating': true
    }
  )
}}

{{ automate_dv.eff_sat(
    src_pk='customer_hk',
    src_dfk='customer_hk',
    src_sfk='customer_hk',
    src_extra_columns=['c_name', 'c_address', 'c_phone', 'c_acctbal', 'c_mktsegment', 'c_comment'],
    src_start_date='effective_from',
    src_end_date='effective_to',
    src_eff='effective_from',
    src_ldts='load_datetime',
    src_source='record_source',
    source_model='stg_customer'
) }}
