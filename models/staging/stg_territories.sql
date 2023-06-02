with base as (

    select * 
    from {{ source('northwind_traders','territories') }}

),

final as (
    
    select 	
        *
    from base

)

select * from final