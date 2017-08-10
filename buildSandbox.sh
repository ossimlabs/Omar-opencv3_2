#!/bin/bash
SCRIPT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
mkdir -p build
if [ $? != 0 ]; then
  echo "Error encountered creating build directory. Check the permissions on $SCRIPT_DIR."
  popd; exit 1
fi
pushd build
cmake -D CMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$SCRIPT_DIR/install -DBUILD_TIFF=ON -DBUILD_EXAMPLES=ON -DCUDA_GENERATION=Auto -DBUILD_NEW_PYTHON_SUPPORT=ON -DWITH_CUDA=ON ..
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

