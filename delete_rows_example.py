# -*- coding: utf-8 -*-

import sys
import csv
import codecs
from glob import glob
from os import rename
from os import listdir
from os import chdir

#chdir('/Users/y_ushioda/Dropbox/RA/us_creditcard')
chdir('/Users/y_ushioda/Dropbox/RA/examplefolder')

with open('realexample.csv','rb') as f:
    mycsv = csv.reader(f)
    mycsv = list(mycsv)
    with open("realexample1.csv",'w') as f1:
        newcsv = csv.writer(f1)
        for line in mycsv[3:-3]:
            newcsv.writerow(line)

chdir('/Users/y_ushioda/Desktop/RA_codes')

