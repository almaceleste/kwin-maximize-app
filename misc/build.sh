#!/bin/bash

name="$(basename `git rev-parse --show-toplevel` | sed -r 's/^kwin-//g').kwinscript"

rm $name
cd ./src
zip -r ../$name *
