-- order_id
-- receita
-- desconto
-- porcent_desconto
-- faturado

with orders_1_product as (
    select * from {{ ref('int_orders_details_with_1_product') }}
),

orders_more_1_product as (
    select * from {{ ref('int_orders_details_with_MORE_1_product') }}
)

select * from orders_1_product
union all
select * from orders_more_1_product    
