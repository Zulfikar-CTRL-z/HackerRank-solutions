# 15 Days of Learning SQL

![Difficulty](https://img.shields.io/badge/Difficulty-Medium-yellow)

## Problem

Julia conducted a $15$ days of learning SQL contest. The start date of the contest was _March 01, 2016_ and the end date was _March 15, 2016_. 

Write a query to print total number of unique hackers who made at least $1$ submission each day (starting on the first day of the contest), and find the _hacker\_id_ and _name_ of the hacker who made maximum number of submissions each day. If more than one such hacker has a maximum number of submissions, print the lowest *hacker\_id*. The query should print this information for each day of the contest, sorted by the date.

----

**Input Format**

The following tables hold contest data:

- _Hackers:_ The _hacker\_id_ is the id of the hacker, and _name_ is the name of the hacker.<img src="https://s3.amazonaws.com/hr-challenge-images/19597/1458511164-12adec3b8b-ScreenShot2016-03-21at3.26.47AM.png"/>

- _Submissions:_ The _submission\_date_ is the date of the submission, _submission\_id_ is the id of the submission, _hacker\_id_ is the id of the hacker who made the submission, and _score_ is the score of the submission. <img src="https://s3.amazonaws.com/hr-challenge-images/19597/1458511251-0b534030b9-ScreenShot2016-03-21at3.26.56AM.png"/>

**Constraints**

 

**Output Format**

## Solution

**Language:** SQL  
**Runtime:** N/A  
**Memory:** N/A  
**Submitted:** 2026-10-07T17:04:44.877Z  

```sql
/*
Enter your query here.
*/
SELECT 
    SUBMISSION_DATE,
    (
        SELECT COUNT(DISTINCT HACKER_ID)  
        FROM SUBMISSIONS S2  
        WHERE S2.SUBMISSION_DATE = S1.SUBMISSION_DATE AND    
            (
                SELECT COUNT(DISTINCT S3.SUBMISSION_DATE) 
                FROM SUBMISSIONS S3 
                WHERE S3.HACKER_ID = S2.HACKER_ID AND S3.SUBMISSION_DATE < S1.SUBMISSION_DATE
            ) = DATEDIFF(S1.SUBMISSION_DATE, '2016-03-01')
    ) AS COUNT_HACKERS,
    (
        SELECT HACKER_ID 
        FROM SUBMISSIONS S2 
        WHERE S2.SUBMISSION_DATE = S1.SUBMISSION_DATE 
        GROUP BY HACKER_ID 
        ORDER BY COUNT(SUBMISSION_ID) DESC, HACKER_ID 
        LIMIT 1
    ) AS TMP,
    (
        SELECT NAME 
        FROM HACKERS 
        WHERE HACKER_ID = TMP
    ) AS HACKER_NAME
FROM
    (
        SELECT DISTINCT SUBMISSION_DATE 
        FROM SUBMISSIONS
    ) S1
GROUP BY 
    SUBMISSION_DATE;

```

---

[View on HackerRank](https://www.hackerrank.com/challenges/15-days-of-learning-sql/problem)