#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os
import sys
import subprocess

from parser import *
from commands import *

PROGRAM_PATH = os.path.abspath(sys.path[0])

def main():
	#open file to write log from julius
	f = open(os.path.join(PROGRAM_PATH, '../output.log'), 'w')
	#open command files and return dictionary of commands
	commands_dict = read_commands()
	#create absolute path to julius
	julius_path = os.path.join(PROGRAM_PATH, '../julius_engine/julius')
	config_path = os.path.join(PROGRAM_PATH, '../config.jconf')
	cmd = [julius_path, '-C', config_path]
	#open subprocess and read stdout
	p = subprocess.Popen(cmd, stdout=subprocess.PIPE)
	while True:
		#read stdout line
		out = p.stdout.readline()
		#check if line is empty or if subprocess has finished
		if out == '' and p.poll() != None:
			break
		if out != '':
			#write stdout to file
			f.write(out)
			#print stdout to terminal
			sys.stdout.write(out)
			sys.stdout.flush()
			#parse stdout line
			parser(out, commands_dict)
			

#test
if __name__ == "__main__":
	main()

