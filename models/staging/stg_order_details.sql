with base as (

    select * 
    from {{ source('northwind_traders','order_details') }}

),

final as (
    
    select 	
        *
    from base

)

select * from final