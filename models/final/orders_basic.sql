-- miami heat in 7
with orders_details_info as (

    select 
        order_id,
        receita,
        desconto,
        porcent_desconto,
        faturado
    from {{ ref('int_orders_details') }}
),

orders as (

    select 
        order_id,
        order_date,
        customer_id
    from {{ ref('stg_orders') }}
)

select
    o.order_id as id_pedido,
    o.order_date as data_pedido,
    o.customer_id as id_cliente,
    od.receita,
    od.desconto,
    od.faturado
from
    orders o
left join orders_details_info od
on o.order_id = od.order_id