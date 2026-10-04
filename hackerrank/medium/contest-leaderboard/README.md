# Challenges

![Difficulty](https://img.shields.io/badge/Difficulty-Medium-yellow)

## Problem

You did such a great job helping Julia with her last coding contest challenge that she wants you to work on this one, too! 

The total score of a hacker is the sum of their maximum scores for all of the challenges. Write a query to print the _hacker\_id_, _name_, and total score of the hackers ordered by the descending score. If more than one hacker achieved the same total score, then sort the result by ascending _hacker\_id_. Exclude all hackers with a total score of $0$ from your result.


**Input Format**

The following tables contain contest data:

- _Hackers:_ The _hacker\_id_ is the id of the hacker, and _name_ is the name of the hacker. <img src="https://s3.amazonaws.com/hr-challenge-images/19503/1458522826-a9ddd28469-ScreenShot2016-03-21at6.40.27AM.png"/>

- _Submissions:_ The _submission\_id_ is the id of the submission, _hacker\_id_ is the id of the hacker who made the submission, _challenge\_id_ is the id of the challenge for which the submission belongs to, and _score_ is the score of the submission. <img src="https://s3.amazonaws.com/hr-challenge-images/19503/1458523022-771511df90-ScreenShot2016-03-21at6.40.37AM.png"/>

**Constraints**

 

**Output Format**

## Solution

**Language:** SQL  
**Runtime:** N/A  
**Memory:** N/A  
**Submitted:** 2026-10-04T13:54:31.486Z  

```sql
/*
Enter your query here.
*/
SELECT c.hacker_id, h.name, COUNT(c.challenge_id) AS cnt 
FROM Hackers AS h 
JOIN Challenges AS c ON h.hacker_id = c.hacker_id 
GROUP BY c.hacker_id, h.name 
HAVING cnt = (
    SELECT COUNT(c1.challenge_id) 
    FROM Challenges AS c1 
    GROUP BY c1.hacker_id 
    ORDER BY COUNT(*) DESC 
    LIMIT 1
) 
OR cnt NOT IN (
    SELECT COUNT(c2.challenge_id) 
    FROM Challenges AS c2 
    GROUP BY c2.hacker_id 
    HAVING c2.hacker_id <> c.hacker_id
) 
ORDER BY cnt DESC, c.hacker_id;

```

---

[View on HackerRank](https://www.hackerrank.com/challenges/contest-leaderboard/problem)