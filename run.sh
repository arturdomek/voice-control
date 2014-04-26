#!/bin/bash
#This is a script for running voice recognition from microphone.
#Just run in terminal, and adjust your mic input volume.
#Make sure that mic input level is not too high.

#PLUGIN_PATH="plugins/clementine_plugin/"
#PLUGIN_PATH="plugins/rhytmbox_plugin/"
PLUGIN_PATH="plugins/firefox_plugin/"

python python_executor/main.py --path $PLUGIN_PATH

