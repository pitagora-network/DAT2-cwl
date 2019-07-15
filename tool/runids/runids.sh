#!/bin/sh
#set -eux

#SraRunTable=$1

tail -n+2 $1 | cut -f7 > run_ids
