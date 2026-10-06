# cook your dish here
import sys
def main():
    input_data=sys.stdin.read().split()
    if not input_data:
        return
    T = int(input_data[0])
    for i in range(1,T+1):
        N=int(input_data[i])
        print(N+1)

main()