#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os
import sys
import subprocess
import time

def parser(out_log_line, commands_dict):
	#open dev/null to hide log
	devnull = open(os.devnull, 'w')
	#create list of words from out_log_line
	sentence = [item for item in out_log_line.split()]
	#chcek if sentence is empty
	if sentence != []:
		#check if sentence is correct
		if sentence[0] == 'sentence1:' and len(sentence) > 2:
			#create key to command dictionary
			key = ' '.join(sentence[2:])
			#if command exist - activate it
			if key in commands_dict:
				print 'COMMAND ACTIVATION'
				#call espeak text2speech
				subprocess.call(['espeak', '-v+f4', '-s', '140', 'COMMAND ACTIVATION'], stdout=devnull, stderr=subprocess.STDOUT)
				print commands_dict[key]
				txt2speech = ['espeak', '-v+f4', '-s', '140']
				txt2speech.extend([commands_dict[key]])
				subprocess.Popen(txt2speech, stdout=devnull, stderr=subprocess.STDOUT)
				#wait some seconds
				time.sleep(2)
				#activate voice command
				subprocess.Popen(commands_dict[key].split(), stdout=devnull, stderr=subprocess.STDOUT)



#test
if __name__ == "__main__":
	pass

