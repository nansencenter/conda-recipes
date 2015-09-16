#!/bin/bash

#echo '----------------------------------------------------------'
#pwd
#echo "Builiding, Prefix:" + $PREFIX
#echo "$INCLUDE_PATH:" $INCLUDE_PATH
#ls

#export SHELL=/bin/bash

#export LIBCURL_CFLAGS=-I$PREFIX/include
#export INCLUDE_PATH=$PREFIX/include
#export CFLAGS="-I$PREFIX/include"
#export CPPFLAGS="-I$PREFIX/include"
#export LD_LIBRARY_PATH=$SYS_PREFIX/lib
export LDFLAGS="-L$SYS_PREFIX/lib"
export CPPFLAGS="-I$PREFIX/include"

printenv
#sed -i 's/\/bin\/sh/\/bin\/bash/g' ./aclocal.m4 ./conf/compile ./conf/config.guess ./conf/config.rpath ./conf/config.sub ./conf/depcomp ./conf/install-sh ./conf/libtool.m4 ./conf/ltmain.sh ./conf/missing ./configure ./dap-config-pkgconfig ./dap-config.in ./gl/config.charset ./gl/m4/lib-ld.m4 ./gl/m4/lib-link.m4 ./OSX_Resources/InstallationCheck ./tests/atconfig ./tests/DMRTest ./tests/DDSTest ./tests/DASTest ./tests/EXPRTest ./tests/getdapTest ./unit-tests/cache-testsuite/cleanup.sh.in 

bash configure \
    --enable-threads=pth \
    --prefix=$PREFIX

sed -i 's/\/bin\/sh/\/bin\/bash/g' Makefile

make
make install
