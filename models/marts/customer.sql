select
  hc.customer_hk as customer_id,
  hc.c_custkey as customer_key,
	sc.c_name as customer_name,
	sc.c_address as customer_addr,
	scn.n_name as customer_nation,
  scnr.r_name as customer_region,
	sc.c_phone as customer_phone,
	sc.c_acctbal  as customer_acct_balance ,
	sc.c_mktsegment as market_segment,
from {{ ref('hub_customer') }} hc
  join {{ ref('sat_customer') }} sc on sc.customer_hk = hc.customer_hk
  join {{ ref('link_customer_nation') }} lcn on lcn.customer_hk = hc.customer_hk
  join {{ ref('sat_nation') }} scn on scn.nation_hk = lcn.nation_hk
  join {{ ref('link_nation_region') }} lcnr on lcnr.nation_hk = lcn.nation_hk
  join {{ ref('sat_region') }} scnr on scnr.region_hk = lcnr.region_hk
where  sc.effective_to  = '9999-12-31 23:59:59.999999'
  and lcn.effective_to  = '9999-12-31 23:59:59.999999'
  and scn.effective_to  = '9999-12-31 23:59:59.999999'
  and lcnr.effective_to = '9999-12-31 23:59:59.999999'
  and scnr.effective_to = '9999-12-31 23:59:59.999999'