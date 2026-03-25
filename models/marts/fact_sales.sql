select
    ho.order_hk as order_id,
    loc.customer_hk as customer_id,
    lli.part_hk as part_id,
    lli.supplier_hk as supplier_id,
    lli.l_linenumber as line_number,
    lli.l_quantity as quantity,
    lli.l_extendedprice as extended_price,
    lli.l_discount as discount,
    lli.l_tax as tax,
    lli.l_returnflag as return_flag,
    lli.l_linestatus as line_status,
    lli.l_shipdate as ship_date,
    lli.l_commitdate as commit_date,
    lli.l_receiptdate as receipt_date,
    lli.l_shipinstruct as ship_instruct,
    lli.l_shipmode as ship_mode,
    lli.l_comment as comment,
    -- Расчётные поля
    (lli.l_extendedprice * (1 - lli.l_discount)) as net_price,
    (lli.l_extendedprice * (1 - lli.l_discount) * (1 + lli.l_tax)) as total_price_with_tax
from {{ ref('hub_order') }} ho 
  join {{ ref('sat_order') }} so on so.order_hk = ho.order_hk
  join {{ ref('link_lineitem') }} lli on ho.order_hk = lli.order_hk
  join {{ ref('link_order_customer') }} loc on loc.order_hk = ho.order_hk 
where 
       so.effective_to = '9999-12-31 23:59:59.999999'
  and loc.effective_to = '9999-12-31 23:59:59.999999'