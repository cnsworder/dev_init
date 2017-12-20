#!/bin/env bash

SRC=$1
DIS=$2

echo "sync file"
rsync -avrhP $1 $2 --exclude=".git*"

