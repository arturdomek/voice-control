#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os
import sys
import getopt
import subprocess

from parser import *
from commands import *

PROGRAM_PATH = os.path.abspath(sys.path[0])

def main():
	#get path to plugin directory
	plugin_path = ""
	try:
		opts, args = getopt.getopt(sys.argv[1:], "p:", ["help", "path="])
	except getopt.GetoptError:
		print "Error"
		sys.exit(2)
	for opt, arg in opts:
		if opt == "--help":
			print "Opcje:"
			print "  '--help'          -- help"
			print "  '--path'          -- path to plugin directory"
			print "Example command:"
			print "main.py --path 'plugins/my_plugin/'"
		elif opt in ("-p", "--path"):
			plugin_path = arg
	#open file to write log from julius
	f = open(os.path.join(PROGRAM_PATH, '../output.log'), 'w')
	#open command files and return dictionary of commands
	commands_dict = read_commands(plugin_path)
	#create absolute path to julius
	julius_path = os.path.join(PROGRAM_PATH, '../julius_engine/julius')
	config_path = os.path.join(PROGRAM_PATH, '../config.jconf')
	cmd = [julius_path, '-C', config_path]
	#add dfa file of plugin
	dfa_path = '../' + plugin_path + 'sample.dfa'
	dfa_path = os.path.join(PROGRAM_PATH, dfa_path)
	cmd.extend(['-dfa', dfa_path])
	#add dict file of plugin
	dict_path = '../' + plugin_path + 'sample.dict'
	dict_path = os.path.join(PROGRAM_PATH, dict_path)
	cmd.extend(['-v', dict_path])
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

