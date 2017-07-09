#!/usr/bin/python
import fileinput
import os

value = os.urandom(32)
filename = "/var/www/modern-paste/app/config.py"

with open(filename, "a") as myfile:
 myfile.write("\nFLASK_SECRET_KEY = " + repr(value) + "\n")
