with 

source as (

    select * from {{ source('raw', 'bing') }}

),

renamed as (

    select
        date_date,
        paid_source,
        campaign_key,
        CONCAT (campaign_key, "_", date_date) AS campaign_date_key,
        campgn_name AS campaign_name,
        CAST (ads_cost AS FLOAT64) AS ads_cost,
        impression,
        click

    from source

)

select * from renamed
