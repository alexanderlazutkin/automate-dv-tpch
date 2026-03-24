{{ automate_dv.hub(
    src_pk='part_pk',
    src_nk='p_partkey',
    src_ldts='load_datetime',
    src_source='record_source',
    source_model='stg_part'
) }}

