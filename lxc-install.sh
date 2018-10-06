#!/bin/bash

lede_repo='https://github.com/lede-project/source.git'

apt update -y && apt upgrade -y

cat packages.txt | xargs -n 1 apt install -y
git clone $lede_repo
mv source lede
mv lxc-build.sh lede/
cd lede
./scripts/feeds update -a
./scripts/feeds install -a
cp ../.config ./
