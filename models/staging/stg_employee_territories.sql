with base as (

    select * 
    from {{ source('northwind_traders','employee_territories') }}

),

final as (
    
    select 	
        *
    from base

)

select * from final