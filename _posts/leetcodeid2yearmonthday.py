#!/usr/bin/python
# -*- coding: UTF-8 -*-

import datetime
import sys

import shutil


x = datetime.datetime.strptime("1998-01-01",'%Y-%m-%d')

if __name__ == "__main__":
    num = sys.argv[1].replace('.', '')
    name = sys.argv[2]
    file_id = "2010-01-01"
    try:
        file_id = (x + datetime.timedelta(days=int(num) - 1)).strftime("%Y-%m-%d")
    except :
        print("error")
    infile = './template.md'
    outfile ="./" + file_id + '-leetcode-' + str(num) + "-" + name + ".md"
    print(outfile)
    shutil.copy(infile, outfile)


