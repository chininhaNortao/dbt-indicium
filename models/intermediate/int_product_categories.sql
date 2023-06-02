with categories as (

    select
        category_id,
        category_name
    from {{ ref('stg_categories') }}

),

product as (
    
    select 	
        product_id,
        product_name,
        category_id
    from {{ ref('stg_products') }}

)

select
    product.product_id,
    product.product_name,
    cat.category_name,
from
    product
left join
    categories as cat
on product.category_id = cat.category_id