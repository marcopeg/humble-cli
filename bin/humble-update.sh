#!/bin/bash

SCRIPT_CWD=$(dirname $(readlink -n ${BASH_SOURCE[0]}))
(cd $SCRIPT_CWD && git pull origin master)
