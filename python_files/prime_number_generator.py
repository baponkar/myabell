"""
Author : Bapon Kar
Date: 02/01/2019
Description : This Python script generate prime number infinitely in a file "prime.csv"
Last Modification : 02/01/2019
"""
#!/usr/bin/env python3

import math
file = open("prime.txt","w")

def prime_check(x):
    flag = 0
    for i in range(2,x):
        if x % i == 0:
            flag = 1
            break
    if flag == 0:
        res = "prime"
    else:
        res = "not prime"
    return res

def infinite_num():
    j = 2
    while True:
        j=j+1
        yield j

k = 0
for i in infinite_num():
    if prime_check(i) == "prime":
        k = k + 1
        file = open("prime.csv","a+")
        j = str(k) + "," + str(i) + "\n"
        file.write(j)
        file.close()

