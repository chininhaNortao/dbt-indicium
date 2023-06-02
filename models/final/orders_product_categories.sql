with order_details as (
    select * from {{ ref('int_orders_details_product') }}
),

product_categories as (
    select * from {{ ref('int_product_categories') }}
)

select
    od.order_id,
    pc.product_name,
    pc.category_name,
    od.total_faturado,
    od.desconto,
    od.faturado
from
    order_details od
left join product_categories pc
on od.product_id = pc.product_id