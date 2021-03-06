#!/bin/bash

#force python bindings to not be built
export PYTHON=

sed -i 's/\/bin\/sh/\/bin\/bash/g' configure


bash configure \
    --without-python \
    --with-hdf4=$PREFIX \
    --with-hdf5=$PREFIX \
    --with-netcdf=$PREFIX \
    --enable-netcdf4 \
    --with-dods-root=$PREFIX \
    --with-geos=$PREFIX/bin/geos-config \
    --with-static-proj4=$PREFIX \
    --with-jasper=$PREFIX \
    --with-xml2=$PREFIX \
    --prefix=$PREFIX \
	--disable-rpath


make
make install

# Make sure GDAL_DATA and set and still present in the package
# https://github.com/conda/conda-recipes/pull/267
ACTIVATE_DIR=$PREFIX/etc/conda/activate.d
DEACTIVATE_DIR=$PREFIX/etc/conda/deactivate.d
mkdir -p $ACTIVATE_DIR
mkdir -p $DEACTIVATE_DIR

cp $RECIPE_DIR/posix/activate.sh $ACTIVATE_DIR/gdal-activate.sh
cp $RECIPE_DIR/posix/deactivate.sh $DEACTIVATE_DIR/gdal-deactivate.sh

# Set GDAL_DATA if you are not using a virtual environment

export GDAL_DATA=$(gdal-config --datadir)
echo 'export GDAL_DATA=$(gdal-config --datadir)' >> ~/.bashrc
