#!/bin/bash
#
# Usage: buildSandbox [<install-dir>]
#
# If the installation directory is omitted, it will be installed in $PWD/install. If a system
# install (say, to /usr/local) is being performed, this needs to be run with "sudo"
 

SCRIPT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

CMAKE_INSTALL_PREFIX=$1 
if [ -z $CMAKE_INSTALL_PREFIX ] ; then
  CMAKE_INSTALL_PREFIX=$SCRIPT_DIR/install
fi

mkdir -p build
if [ $? != 0 ]; then
  echo "Error encountered creating build directory. Check the permissions on $SCRIPT_DIR."
  popd; exit 1
fi

pushd build
rm CMakeCache.txt
cmake -D CMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$CMAKE_INSTALL_PREFIX -DBUILD_TIFF=ON -DBUILD_EXAMPLES=ON -DCUDA_GENERATION=Auto -DBUILD_NEW_PYTHON_SUPPORT=ON -DWITH_CUDA=ON ..
if [ $? != 0 ]; then
  echo "Error encountered in cmake command."
  popd; exit 1
fi

make -j8
if [ $? != 0 ]; then
  echo "Error encountered in build."
  popd; exit 1
fi

make install
if [ $? != 0 ]; then
  echo "Error encountered in install."
  popd; exit 1
fi
popd

