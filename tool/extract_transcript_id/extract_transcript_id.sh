#!/bin/sh

IN=$1

perl -F"\s+" -lane 'print $F[0] if $_ !~ /^\#/' ${1} | sort | uniq