#!/bin/bash

dir="$(git rev-parse --show-toplevel)"
name=$(basename "$dir" | sed -r 's/^kwin-//g').kwinscript

rm "$dir/$name"
cd "$dir/src"
zip -r "$dir/$name" *
