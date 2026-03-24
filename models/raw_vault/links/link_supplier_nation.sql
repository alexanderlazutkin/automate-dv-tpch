{{ automate_dv.eff_link(
    src_pk='supplier_nation_pk',
    src_fk=['supplier_pk', 'nation_pk'],
    effective_date_from='effective_from',
    effective_date_to='effective_to',
    src_ldts='load_datetime',
    src_source='record_source',
    source_model='stg_supplier_nation'
) }}
