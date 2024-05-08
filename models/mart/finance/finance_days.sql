SELECT date_date
, COUNT (orders_id) AS nb_transactions
, ROUND (SUM (revenue), 1) AS revenue
, ROUND (SAFE_DIVIDE (SUM(revenue), COUNT(orders_id)), 1) AS average_basket
, ROUND (SUM (margin), 1) AS margin
, ROUND (SUM(margin + shipping_fee - logcost - ship_cost), 1) AS operational_margin
FROM {{ ref('int_orders_margin') }}
LEFT JOIN {{ ref('stg_raw__ship') }}
USING (orders_id)
GROUP BY date_date 
ORDER BY date_date DESC