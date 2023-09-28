#!/usr/bin/env bash

cur=$PWD
for repo in $(ls awesome); do
    cd ${cur}/awesome/$repo
    # git checkout main
    br=$(git branch)
    git pull origin $br
done
