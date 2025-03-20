SELECT
    e.name
FROM
    Employee e
    INNER JOIN
    (SELECT
        managerId,
        name,
        COUNT(managerId) AS CNT
    FROM
        Employee
    GROUP BY
        managerId) c
    ON
    e.id = c.managerId AND
    c.CNT >= 5