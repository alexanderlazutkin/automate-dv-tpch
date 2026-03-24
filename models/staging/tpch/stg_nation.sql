{{ automate_dv.stage(
    source_model={'tpch': 'nation'},
    hashed_columns={
        'nation_hk': 'n_nationkey',
        'region_hk': 'n_regionkey',
        'nation_region_lk': ['n_nationkey', 'n_regionkey'],
        'nation_pk': 'n_nationkey',
        'region_pk': 'n_regionkey',
        'nation_region_pk': ['n_nationkey', 'n_regionkey'],
        'hashdiff': [
            'n_name',
            'n_comment'
        ]
    },
    derived_columns={
        'effective_from': 'CURRENT_TIMESTAMP',
        'effective_to': "CAST('9999-12-31 23:59:59.999999' AS TIMESTAMP)",
        'load_datetime': 'CURRENT_TIMESTAMP',
        'record_source': '!TPCH'
    }
) }}
