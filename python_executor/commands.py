#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os
import sys

PROGRAM_PATH = os.path.abspath(sys.path[0])

def read_commands(plugin_path):
	commands_dict = {}
	#open commands file
	path = '../' + plugin_path + 'sample.commands'
	f = open(os.path.join(PROGRAM_PATH, path), 'r')
	commands_dict = file2dict(f)
	return commands_dict

def file2dict(f):
	dictionary = {}
	next(f)
	for line in f:
		if line.strip() != '':
			(key, val) = line.strip().split(':')
			dictionary[key.strip()] = val.strip()
	return dictionary
	
#test
if __name__ == "__main__":
	print read_commands()

