#!/bin/bash

case $1 in
    clean)
        make distclean
        make clean
        exit 0
    ;;
esac

export FORCE_UNSAFE_CONFIGURE=1
make V=s -j4
