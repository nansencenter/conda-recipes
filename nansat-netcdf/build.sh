#!/bin/bash

# http://www.michael-joost.de/gdal_install.html
unset CC CPP CXX

export LDFLAGS="-L$PREFIX/lib"
export CPPFLAGS="-I$PREFIX/include"

#if [ `uname` == Darwin ]; then
#    export LDFLAGS="$LDFLAGS -headerpad_max_install_names"
#fi
#force python bindings to not be built
#export PYTHON=

sed -i 's/\/bin\/sh/\/bin\/bash/g' configure


bash configure \
    --enable-netcdf-4 \
    --enable-dynamic-loading \
    --enable-hdf4 \
    --enable-hdf4-file-tests \
    --enable-extra-example-tests \
    --enable-dap-auth-tests \
    --enable-dap-long-tests \
    --enable-extra-tests \
    --enable-large-file-tests \
    --enable-benchmarks \
    --prefix=$PREFIX


make
make install

# Make sure GDAL_DATA and set and still present in the package
# https://github.com/conda/conda-recipes/pull/267
#ACTIVATE_DIR=$PREFIX/etc/conda/activate.d
#DEACTIVATE_DIR=$PREFIX/etc/conda/deactivate.d
#mkdir -p $ACTIVATE_DIR
#mkdir -p $DEACTIVATE_DIR
#
#cp $RECIPE_DIR/posix/activate.sh $ACTIVATE_DIR/gdal-activate.sh
#cp $RECIPE_DIR/posix/deactivate.sh $DEACTIVATE_DIR/gdal-deactivate.sh
#
