#!/bin/bash

# turn on bash's job control
set -m

./execution.sh &

./consensus.sh

fg %1