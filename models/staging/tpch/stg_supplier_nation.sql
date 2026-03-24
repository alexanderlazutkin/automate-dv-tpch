{{ automate_dv.stage(
    source_model={'tpch': 'supplier'},
    hashed_columns={
        'supplier_pk': 's_suppkey',
        'nation_pk': 's_nationkey',
        'supplier_nation_pk': ['s_suppkey', 's_nationkey']
    },
    derived_columns={
        'effective_from': 'CURRENT_TIMESTAMP',
        'effective_to': "CAST('9999-12-31 23:59:59.999999' AS TIMESTAMP)",
        'load_datetime': 'CURRENT_TIMESTAMP',
        'record_source': '!TPCH'
    }
) }}
