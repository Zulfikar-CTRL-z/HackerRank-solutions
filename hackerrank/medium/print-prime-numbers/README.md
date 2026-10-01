# Print Prime Numbers

![Difficulty](https://img.shields.io/badge/Difficulty-Medium-yellow)

## Problem

Write a query to print all *prime numbers* less than or equal to $1000$. Print your result on a single line, and use the ampersand ($\&$) character as your separator (instead of a space).


For example, the output for all prime numbers $\leq 10$ would be:

	2&3&5&7

**Input Format**

 

**Constraints**

 

**Output Format**

## Solution

**Language:** SQL  
**Runtime:** N/A  
**Memory:** N/A  
**Submitted:** 2026-10-01T14:37:31.314Z  

```sql
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

```

---

[View on HackerRank](https://www.hackerrank.com/challenges/print-prime-numbers/problem)