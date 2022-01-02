#!/bin/sh

nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader,nounits | awk '{ print "GPU",""$1"","°C"}'
