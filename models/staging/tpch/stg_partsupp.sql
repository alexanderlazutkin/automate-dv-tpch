{{ automate_dv.stage(
    source_model={'tpch': 'partsupp'},
    hashed_columns={
        'part_hk': 'ps_partkey',
        'supplier_hk': 'ps_suppkey',
        'part_supplier_lk': ['ps_partkey', 'ps_suppkey'],
        'part_pk': 'ps_partkey',
        'supplier_pk': 'ps_suppkey',
        'part_supplier_pk': ['ps_partkey', 'ps_suppkey'],
        'hashdiff': [
            'ps_availqty',
            'ps_supplycost',
            'ps_comment'
        ]
    },
    derived_columns={
        'effective_from': 'CURRENT_TIMESTAMP',
        'effective_to': "CAST('9999-12-31 23:59:59.999999' AS TIMESTAMP)",
        'load_datetime': 'CURRENT_TIMESTAMP',
        'record_source': '!TPCH'
    }
) }}
