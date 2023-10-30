#!/bin/bash

sudo apt update && sudo apt -y install redshift

# set screen color temperature to 3000
redshift -m randr -O 3000
# reset
#redshift -m randr -x

