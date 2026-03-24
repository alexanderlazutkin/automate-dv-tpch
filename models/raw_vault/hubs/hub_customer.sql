{{ automate_dv.hub(
    src_pk='customer_pk',
    src_nk='c_custkey',
    src_ldts='load_datetime',
    src_source='record_source',
    source_model='stg_customer'
) }}

