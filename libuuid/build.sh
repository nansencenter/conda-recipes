#!/bin/bash
bash configure \
    --prefix=$PREFIX

sed -i 's/\/bin\/sh/\/bin\/bash/g' Makefile

make
make install
