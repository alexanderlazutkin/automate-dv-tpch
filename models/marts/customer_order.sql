select
    ho.order_hk,
	ho.o_orderkey as order_key,
	so.o_orderstatus as order_status,
	so.o_totalprice as total_price,
	so.o_orderdate as order_date,
	so.o_orderpriority as order_priority,
	so.o_clerk as clerk,
	so.o_shippriority as ship_priority
from {{ ref('hub_order') }} ho 
  join {{ ref('sat_order') }} so on so.order_hk = ho.order_hk
where so.effective_to   = '9999-12-31 23:59:59.999999'