{{ automate_dv.hub(
    src_pk='supplier_pk',
    src_nk='s_suppkey',
    src_ldts='load_datetime',
    src_source='record_source',
    source_model='stg_supplier'
) }}

