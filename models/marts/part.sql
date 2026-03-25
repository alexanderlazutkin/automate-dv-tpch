select
    hp.part_hk as part_id,
	hp.p_partkey as part_key,
	sp.p_name as part_name,
	sp.p_mfgr as manufacturer,
	sp.p_brand as brand,
	sp.p_type as part_type,
	sp.p_size part_size,
	sp.p_container as part_container ,
	sp.p_retailprice as part_retail_price
from {{ ref('hub_part') }} hp
 join {{ ref('sat_part') }} sp on sp.part_hk = hp.part_hk
where sp.effective_to   = '9999-12-31 23:59:59.999999'