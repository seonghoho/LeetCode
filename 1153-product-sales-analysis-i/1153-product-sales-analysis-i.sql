SELECT
    product_name,
    year,
    price
FROM
    Sales s
    LEFT JOIN 
        Product p
    On
        s.product_id = p.product_id