{{ automate_dv.stage(
    source_model={'tpch': 'customer'},
    hashed_columns={
        'customer_pk': 'c_custkey',
        'nation_pk': 'c_nationkey',
        'customer_nation_pk': ['c_custkey', 'c_nationkey']
    },
    derived_columns={
        'effective_from': 'CURRENT_TIMESTAMP',
        'effective_to': "CAST('9999-12-31 23:59:59.999999' AS TIMESTAMP)",
        'load_datetime': 'CURRENT_TIMESTAMP',
        'record_source': '!TPCH'
    }
) }}
