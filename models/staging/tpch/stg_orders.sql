{{ automate_dv.stage(
    source_model={'tpch': 'orders'},
    include_source_columns=true,
    hashed_columns={
        'order_hk': 'o_orderkey',
        'customer_hk': 'o_custkey',
        'order_customer_hk': ['o_orderkey', 'o_custkey'],
        'hashdiff': [
            'o_orderkey',
            'o_orderstatus',
            'o_totalprice',
            'o_orderdate',
            'o_orderpriority',
            'o_clerk',
            'o_shippriority',
            'o_comment'
        ]
    },
    derived_columns={
        'effective_from': 'CURRENT_TIMESTAMP',
        'effective_to': "CAST('9999-12-31 23:59:59.999999' AS TIMESTAMP)",
        'load_datetime': 'CURRENT_TIMESTAMP',
        'record_source': '!TPCH'
    }
) }}
