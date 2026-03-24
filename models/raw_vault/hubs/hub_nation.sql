{{ automate_dv.hub(
    src_pk='nation_pk',
    src_nk='n_nationkey',
    src_ldts='load_datetime',
    src_source='record_source',
    source_model='stg_nation'
) }}

