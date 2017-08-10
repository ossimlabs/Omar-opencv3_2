#!/bin/bash
mkdir -p build
if [ $? != 0 ]; then
  echo "Error encountered creating build directory. Check the permissions on $PWD."
  popd; exit 1
fi
pushd build
cmake -D CMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/home/okramer/dev/ossim/3rdParty/omar-opencv3_2/install -DBUILD_TIFF=ON -DBUILD_EXAMPLES=ON -DCUDA_GENERATION=Auto -DBUILD_NEW_PYTHON_SUPPORT=ON -DWITH_CUDA=ON ..
if [ $? != 0 ]; then
  echo "Error encountered in cmake command."
  popd; exit 1
fi
make -j8
popd

