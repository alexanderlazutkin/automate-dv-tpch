{{ automate_dv.stage(
    source_model={'tpch': 'region'},
    hashed_columns={
        'region_hk': 'r_regionkey',
        'region_pk': 'r_regionkey',
        'hashdiff': [
            'r_name',
            'r_comment'
        ]
    },
    derived_columns={
        'effective_from': 'CURRENT_TIMESTAMP',
        'effective_to': "CAST('9999-12-31 23:59:59.999999' AS TIMESTAMP)",
        'load_datetime': 'CURRENT_TIMESTAMP',
        'record_source': '!TPCH'
    }
) }}
