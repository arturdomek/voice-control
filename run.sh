#!/bin/bash
#This is a script for running voice recognition from microphone.
#Just run in terminal, and adjust your mic input volume.
#Make sure that mic input level is not too high.

python $(cd `dirname ${0}`; pwd)/python_executor/main.py

