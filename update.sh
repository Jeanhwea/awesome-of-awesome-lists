#!/usr/bin/env bash

cur=$PWD
for repo in $(ls awesome); do
    cd ${cur}/awesome/$repo
    # git checkout main
    echo "========="
    pwd
    br=$(git branch --show-current)
    git remote -v
    cmd="git pull origin $br"
    echo $cmd
    $cmd
done
