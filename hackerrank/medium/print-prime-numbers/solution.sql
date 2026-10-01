/*
Enter your query here.
*/
WITH RECURSIVE nums AS (
    SELECT 2 AS n
    UNION ALL
    SELECT n + 1
    FROM nums
    WHERE n < 1000
)
SELECT GROUP_CONCAT(n SEPARATOR '&')
FROM nums a
WHERE NOT EXISTS (
    SELECT 1
    FROM nums b
    WHERE b.n <= SQRT(a.n)
      AND a.n % b.n = 0
);
