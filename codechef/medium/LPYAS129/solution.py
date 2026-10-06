numbers = list(map(int, input().split()))
# Update your code below this line
first_index=-1
for i in range(len(numbers)):
    if numbers[i]==8:
        print(i)
        break