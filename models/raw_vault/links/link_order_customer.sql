{{ automate_dv.eff_link(
    src_pk='order_customer_hk',
    src_fk=['order_hk', 'customer_hk'],
    effective_date_from='effective_from',
    effective_date_to='effective_to',
    src_ldts='load_datetime',
    src_source='record_source',
    source_model='stg_orders'
) }}
