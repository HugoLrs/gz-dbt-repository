SELECT 
DATE_TRUNC (date_date, MONTH) AS datemonth
, IFNULL (ROUND(SUM (ads_margin), 1), 0) AS ads_margin
, ROUND ((SUM (average_basket)), 1) AS average_basket
, ROUND ((SUM (operational_margin)), 1) AS operational_margin
FROM {{ ref('finance_campaigns_day') }}
GROUP BY datemonth
ORDER BY datemonth DESC