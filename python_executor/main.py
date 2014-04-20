#!/usr/bin/env python
# -*- coding: utf-8 -*-
import os

def parse(line):
	params = [param.lower() for param in line.split() if param]
	commands = {
		'play': 'clementine --play',
		'pause': 'clementine --pause',
		}
	print params[4]
	b =  params[-2:-1][0]
	print b
	if b in commands:
		print 'tak'
		print commands[b]
		os.popen(commands[b])

def main():
	line = "sentence1: <s> VOICE CONTROL PLAY </s>"
	print line
	parse(line)
	

#test
if __name__ == "__main__":
	main()



