SELECT
    s.user_id,
    COALESCE(ROUND(c.confirm_cnt / c.total_cnt, 2), 0) AS confirmation_rate
FROM
    Signups s
    LEFT JOIN
    (SELECT
        user_id,
        COUNT(CASE 
            WHEN action LIKE 'confirmed'
            THEN 1
            END) AS confirm_cnt,
        COUNT(user_id) AS total_cnt
    FROM
        Confirmations
    GROUP BY
        user_id) c
    ON s.user_id = c.user_id