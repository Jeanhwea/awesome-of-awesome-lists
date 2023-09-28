#!/usr/bin/env bash

cur=$PWD
for repo in $(ls awesome); do
    cd ${cur}/awesome/$repo
    br=$(git branch)
    git pull origin $br
done
