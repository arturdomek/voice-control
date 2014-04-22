#!/bin/sh
#This script make .dict, .term and .dfa file from .grammar and .voca 
./../../julius_engine/bin/mkdfa.pl sample
sleep 1
./../../julius_engine/bin/generate sample


