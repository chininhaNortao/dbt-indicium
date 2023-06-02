with
    order_details as (select * from {{ ref("stg_order_details") }}),

    orders_more_1_product as (

        select t.*
        from order_details t
        where
            exists (
                select 1
                from order_details t1
                where t1.order_id = t.order_id and t1.product_id <> t.product_id
            )
    )

select
    order_id,
    sum(unit_price * quantity)                  as total_faturado,
    sum(unit_price * quantity * discount)       as desconto,
    sum(unit_price * quantity * discount)
    / sum(unit_price * quantity)                as porcent_desconto,
    sum(unit_price * quantity * (1 - discount)) as faturado,
from orders_more_1_product
group by order_id
