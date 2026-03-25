{{ automate_dv.stage(
    source_model={'tpch': 'supplier'},
    include_source_columns=true,
    hashed_columns={
        'supplier_hk': 's_suppkey',
        'nation_hk': 's_nationkey',
        'supplier_nation_hk': ['s_suppkey', 's_nationkey'],
        'hashdiff': [
            's_suppkey',
            's_name',
            's_address',
            's_phone',
            's_acctbal',
            's_comment'
        ]
    },
    derived_columns={
        'effective_from': 'CURRENT_TIMESTAMP',
        'effective_to': "CAST('9999-12-31 23:59:59.999999' AS TIMESTAMP)",
        'load_datetime': 'CURRENT_TIMESTAMP',
        'record_source': '!TPCH'
    }
) }}
