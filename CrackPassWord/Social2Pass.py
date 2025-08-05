#!/usr/bin/env python
from itertools import combinations

_file = "input.txt"



def Generate_Pass(n):
    valid_pass = []
    with open(_file, 'r') as f:
        content = list(map(str.strip, f))


    all_comb = list(combinations(content, n))

    for i, comb in enumerate(all_comb):
        password = comb[0] + comb[1] + comb[2]
        if password[0] not in ['_', '@']:
            valid_pass.append(password)
    return valid_pass


print(Generate_Pass(3))