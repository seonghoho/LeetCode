SELECT
    a.customer_number
FROM
    (SELECT
        COUNT(*) AS order_count,
        customer_number
    FROM
        Orders
    GROUP BY
        customer_number) a
ORDER BY
    a.order_count DESC
LIMIT 1