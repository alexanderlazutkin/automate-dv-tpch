{{ automate_dv.stage(
    source_model={'tpch': 'customer'},
    include_source_columns=true,
    hashed_columns={
        'customer_hk': 'c_custkey',
        'nation_hk': 'c_nationkey',
        'customer_nation_hk': ['c_custkey', 'c_nationkey'],
        'hashdiff': [
            'c_custkey',
            'c_name',
            'c_address',
            'c_phone',
            'c_acctbal',
            'c_mktsegment',
            'c_comment'
        ]
    },
    derived_columns={
        'effective_from': 'CURRENT_TIMESTAMP',
        'effective_to': "CAST('9999-12-31 23:59:59.999999' AS TIMESTAMP)",
        'load_datetime': 'CURRENT_TIMESTAMP',
        'record_source': '!TPCH'
    }
) }}
