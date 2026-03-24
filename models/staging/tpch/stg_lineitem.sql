{{ automate_dv.stage(
    source_model={'tpch': 'lineitem'},
    hashed_columns={
        'lineitem_pk': ['l_orderkey', 'l_linenumber'],
        'lineitem_hk': ['l_orderkey', 'l_linenumber'],
        'order_hk': 'l_orderkey',
        'part_hk': 'l_partkey',
        'supplier_hk': 'l_suppkey',
        'lineitem_order_lk': ['l_orderkey', 'l_linenumber'],
        'lineitem_part_lk': ['l_orderkey', 'l_linenumber', 'l_partkey'],
        'lineitem_part_supplier_lk': ['l_orderkey', 'l_linenumber', 'l_partkey', 'l_suppkey'],
        'order_pk': 'l_orderkey',
        'part_pk': 'l_partkey',
        'supplier_pk': 'l_suppkey',
        'lineitem_order_pk': ['l_orderkey', 'l_linenumber'],
        'lineitem_part_pk': ['l_orderkey', 'l_linenumber', 'l_partkey'],
        'lineitem_part_supplier_pk': ['l_orderkey', 'l_linenumber', 'l_partkey', 'l_suppkey'],
        'hashdiff': [
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
        ]
    },
    derived_columns={
        'effective_from': 'CURRENT_TIMESTAMP',
        'effective_to': "CAST('9999-12-31 23:59:59.999999' AS TIMESTAMP)",
        'load_datetime': 'CURRENT_TIMESTAMP',
        'record_source': '!TPCH'
    }
) }}
