SELECT
    u.name,
    SUM(IF(r.distance IS NULL, 0, r.distance)) travelled_distance
FROM
    Users u 
    LEFT JOIN Rides r
    ON u.id = r.user_id
GROUP BY
    u.id
ORDER BY
    travelled_distance DESC,
    name