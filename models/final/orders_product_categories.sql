with order_details as (
    select * from {{ ref('int_orders_details_product') }}
),

product_categories as (
    select * from {{ ref('int_product_categories') }}
)

select
    od.order_id as id_pedido,
    pc.product_name as nome_produto,
    pc.category_name as nome_categoria,
    od.receita,
    od.desconto,
    od.faturado
from
    order_details od
left join product_categories pc
on od.product_id = pc.product_id