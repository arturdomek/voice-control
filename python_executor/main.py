#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os
import sys
import subprocess

def parser(out_log_line):
	sentence = [item for item in out_log_line.split()]
	commands = {
		'play': 'clementine --play',
		'paused': 'clementine --pause',
		}
	if sentence != []:
		if sentence[0] == 'sentence1:' and len(sentence) > 2:
			key = sentence[-1].lower()
			if key in commands:
				print 'COMMAND ACTIVATION'
				subprocess.call(['espeak', '-v+f4', '-s', '140', 'COMMAND ACTIVATION'])
				print commands[key]
				txt2speech = ['espeak', '-v+f4', '-s', '140']
				txt2speech.extend([commands[key]])
				print txt2speech
				subprocess.call(txt2speech)
				subprocess.call(commands[key].split())

def main():
	f = open('output.log','w')
	julius_path = os.path.join(os.path.abspath(sys.path[0]), '../julius_engine/julius')
	config_path = os.path.join(os.path.abspath(sys.path[0]), '../config.jconf')
	cmd = ' '.join([julius_path, '-C', config_path])
	p = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE)
	while True:
		out = p.stdout.readline()
		if out == '' and p.poll() != None:
			break
		if out != '':
			f.write(out)
			sys.stdout.write(out)
			sys.stdout.flush()
			parser(out)
			

#test
if __name__ == "__main__":
	main()

