{{
  config(
    meta={
      'is_auto_end_dating': true
    }
  )
}}

{{ automate_dv.eff_sat(
    src_pk='part_supplier_lk',
    src_dfk='part_hk',
    src_sfk='supplier_hk',
    src_extra_columns=['ps_availqty', 'ps_supplycost', 'ps_comment'],
    src_start_date='effective_from',
    src_end_date='effective_to',
    src_eff='effective_from',
    src_ldts='load_datetime',
    src_source='record_source',
    source_model='stg_partsupp'
) }}
