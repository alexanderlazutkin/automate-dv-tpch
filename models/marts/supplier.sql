select
    hs.supplier_hk as supplier_id,
	s_suppkey as supplier_key,
	ss.s_name as supplier_name,
	ss.s_address as supplier_addr,
	scn.n_name as supplier_nation,
    scnr.r_name as customer_region,
	ss.s_phone as supplier_phone,
	ss.s_acctbal as supplier_acct_balance 
from {{ ref('hub_supplier') }} hs
  join {{ ref('sat_supplier') }} ss on ss.supplier_hk = hs.supplier_hk
  join {{ ref('link_supplier_nation') }} lcn on lcn.supplier_hk = hs.supplier_hk
  join {{ ref('sat_nation') }} scn on scn.nation_hk = lcn.nation_hk
  join {{ ref('link_nation_region') }} lcnr on lcnr.nation_hk = lcn.nation_hk
  join {{ ref('sat_region') }} scnr on scnr.region_hk = lcnr.region_hk
where ss.effective_to   = '9999-12-31 23:59:59.999999'
  and lcn.effective_to  = '9999-12-31 23:59:59.999999'
  and scn.effective_to  = '9999-12-31 23:59:59.999999'
  and lcnr.effective_to = '9999-12-31 23:59:59.999999'
  and scnr.effective_to = '9999-12-31 23:59:59.999999'