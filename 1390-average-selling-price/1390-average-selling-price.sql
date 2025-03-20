SELECT
    p.product_id,
    COALESCE(ROUND(SUM(p.price * COALESCE(u.units,0)) / NULLIF(SUM(COALESCE(u.units,0)),0), 2),0.00) AS average_price
FROM
    Prices p 
    LEFT JOIN
    UnitsSold u
    ON
    p.product_id = u.product_id AND
    u.purchase_date 
    BETWEEN p.start_date AND p.end_date
GROUP BY
    p.product_id