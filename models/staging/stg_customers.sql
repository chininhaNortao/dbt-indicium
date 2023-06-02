with base as (

    select * 
    from {{ source('northwind_traders','customers') }}

),

final as (
    
    select 	
        *
    from base

)

select * from final