#!/usr/bin/python
# circleYum.py
# version 1.0
# Kai Yu
# github.com/readline
# 150514
##############################################
# A simple script to enhance yum successful rate since yum always 
# turn out errors for some reason in the yum source recently.

import os, sys

def run(cmd):
    pid = os.getpid()
    while 1:
        tmp = os.popen('yum install -y %s && echo PID%d finished' %(cmd, pid))
        output = tmp.read()
        print output
        if output.count('PID%d finished' %pid) == 1:
            break
        print 'Retry...'

def main():
    try:
        itemlist = sys.argv[1:]
    except:
        print sys.argv[0] + ' [item to yum] ...'
    if len(itemlist) == 0:
        print sys.argv[0] + ' [item to yum] ...'
    for item in itemlist:
        run(item)
    print 'All yum works finished!'

if __name__ == '__main__':
    main()
