# LPYAS69

![Difficulty](https://img.shields.io/badge/Difficulty-Medium-yellow)

## Problem

Write a program that checks if a given number is divisible by both 3 and 5.

Check the sample input / output below for more clarity.

### Output Format

If the number is divisible by both 3 and 5 - output 'Divisible by both 3 and 5'

If the number is not divisible by either 3 or 5 (or both of them) - output 'Not divisible by both 3 and 5'

### Sample 1:
Input
Output

```
15
```

```
Divisible by both 3 and 5

```

### Sample 2:
Input
Output

```
20
```

```
Not divisible by both 3 and 5
```

## Solution

**Language:** Python  
**Runtime:** N/A  
**Memory:** N/A  
**Submitted:** 2026-10-06T16:18:29.741Z  

```py
# cook your dish here

num=int(input())
if num%3==0 and num%5==0:
    print("Divisible by both 3 and 5")
else:
    print("Not divisible by both 3 and 5")
```

---

[View on CodeChef](https://www.codechef.com/problems/LPYAS69)