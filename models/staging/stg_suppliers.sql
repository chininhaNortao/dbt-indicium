with base as (

    select * 
    from {{ source('northwind_traders','suppliers') }}

),

final as (
    
    select 	
        *
    from base

)

select * from final