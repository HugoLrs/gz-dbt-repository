SELECT*
, ROUND ((quantity * purchase_price), 2) AS purchase_cost
, ROUND ((revenue - ROUND ((quantity * purchase_price), 2)), 2) AS margin
FROM  {{ ref('stg_raw__sales') }} AS sales
LEFT JOIN  {{ ref('stg_raw__product') }} AS product
USING (products_id)