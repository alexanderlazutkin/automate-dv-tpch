{{ automate_dv.eff_link(
    src_pk='part_supplier_hk',
    src_fk=['part_hk', 'supplier_hk'],
    effective_date_from='effective_from',
    effective_date_to='effective_to',
    src_ldts='load_datetime',
    src_source='record_source',
    source_model='stg_partsupp'
) }}
