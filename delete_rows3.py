# -*- coding: utf-8 -*-

# some comments

import sys
import csv
import codecs
from glob import glob
from os import rename
from os import listdir
from os import chdir

chdir('/Users/y_ushioda/Dropbox/RA')

file = glob('copy.csv')
for fname in file:
    with open(fname,'rU') as f:
        mycsv = csv.reader(f)
        mycsv = list(mycsv)
        newname = fname.replace('*.csv','clean*.csv')
        with open(newname,'w') as f1:
            newcsv = csv.writer(f1)
            for line in mycsv[0:3]:
                newcsv.writerow(line)

chdir('/Users/y_ushioda/Desktop/RA_codes')