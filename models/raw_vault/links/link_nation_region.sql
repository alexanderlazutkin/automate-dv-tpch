{{ automate_dv.eff_link(
    src_pk='nation_region_pk',
    src_fk=['nation_pk', 'region_pk'],
    effective_date_from='effective_from',
    effective_date_to='effective_to',
    src_ldts='load_datetime',
    src_source='record_source',
    source_model='stg_nation'
) }}
