export HDF5_DIR=$PREFIX
export NETCDF4_DIR=$PREFIX

#$PYTHON setup.py build_ext --include-dirs $INCLUDE_PATH --library-dirs $LIBRARY_PATH --gdal-config gdal-config
$PYTHON setup.py build
#$PYTHON setup.py build_scripts
$PYTHON setup.py install
