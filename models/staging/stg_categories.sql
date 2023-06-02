with base as (

    select * 
    from {{ source('northwind_traders','categories') }}

),

final as (
    
    select 	
        *
    from base

)

select * from final