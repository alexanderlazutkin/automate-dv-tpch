{{ automate_dv.hub(
    src_pk='order_hk',
    src_nk='o_orderkey',
    src_ldts='load_datetime',
    src_source='record_source',
    source_model='stg_orders'
) }}

