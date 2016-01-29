#!/bin/bash
unset CC CPP CXX
export CFLAGS=" -fPIC "
export CPPFLAGS="${CFLAGS}"
export CXXFLAGS="${CFLAGS}"

bash configure \
    --prefix=$PREFIX

sed -i 's/\/bin\/sh/\/bin\/bash/g' Makefile

make
make install
