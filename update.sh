#!/usr/bin/env bash

for repo in $(ls awesome); do
    git -C awesome/$repo pull
done
