#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os
import sys

def read_commands():
	commands_dict = {}
	#open clementine commands file
	f_clementine = open('plugins/clementine_plugin/sample.commands', 'r')
	clementine_dict = file2dict(f_clementine)
	commands_dict.update(clementine_dict)
	
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

