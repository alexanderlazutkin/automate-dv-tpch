{{ automate_dv.stage(
    source_model={'tpch': 'part'},
    hashed_columns={
        'part_pk': 'p_partkey',
        'part_hk': 'p_partkey',
        'hashdiff': [
            'p_name',
            'p_mfgr',
            'p_brand',
            'p_type',
            'p_size',
            'p_container',
            'p_retailprice',
            'p_comment'
        ]
    },
    derived_columns={
        'effective_from': 'CURRENT_TIMESTAMP',
        'effective_to': "CAST('9999-12-31 23:59:59.999999' AS TIMESTAMP)",
        'load_datetime': 'CURRENT_TIMESTAMP',
        'record_source': '!TPCH'
    }
) }}
