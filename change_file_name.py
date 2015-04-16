# -*- coding: utf-8 -*-

from glob import glob
from os import rename
from os import listdir
from os import chdir

chdir('/Users/y_ushioda/Dropbox/RA/us_creditcard')
file = glob("*true.csv")
for fname in file:
    rename(fname, fname.replace("true", ""))
    print fname
    
chdir('/Users/y_ushioda/Desktop/RA_codes')