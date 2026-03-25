{{ automate_dv.t_link(
    src_pk='lineitem_hk',
    src_fk=['order_hk', 'part_hk', 'supplier_hk'],
    src_payload=[
        'l_linenumber',
        'l_quantity',
        'l_extendedprice',
        'l_discount',
        'l_tax',
        'l_returnflag',
        'l_linestatus',
        'l_shipdate',
        'l_commitdate',
        'l_receiptdate',
        'l_shipinstruct',
        'l_shipmode',
        'l_comment'
    ],
    src_eff='effective_from',
    src_ldts='load_datetime',
    src_source='record_source',
    source_model='stg_lineitem'
) }}

