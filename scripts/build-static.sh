#!/bin/bash 
SCRIPT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
pushd $SCRIPT_DIR/.. >/dev/null
export CMAKE_DIR=$PWD
popd >/dev/null

BUILD_DIR=$SCRIPT_DIR/../build
CMAKE_INSTALL_PREFIX=$1 
if [ -z $CMAKE_INSTALL_PREFIX ] ; then
  CMAKE_INSTALL_PREFIX=$SCRIPT_DIR/../install
fi

mkdir -p $SCRIPT_DIR/../build
if [ $? != 0 ]; then
  echo "Error encountered creating build directory. Check the permissions on $SCRIPT_DIR."
  popd; exit 1
fi

if [ "${BUILD_FORTIFY}" == "true" ] ; then
  INSERT_FORTIFY_TOOLCHAIN=-DCMAKE_TOOLCHAIN_FILE=${CMAKE_DIR}/fortify/fortify_linux_toolchain.cmake
  echo;echo "Building with fortify toolchain"; echo
fi

pushd $BUILD_DIR
rm CMakeCache.txt
cmake \
   -DCMAKE_BUILD_TYPE=Release \
   -DBUILD_SHARED_LIBS=OFF \
   -DCMAKE_INSTALL_PREFIX=$CMAKE_INSTALL_PREFIX \
   -DBUILD_TIFF=ON \
   -DBUILD_EXAMPLES=OFF \
   -DBUILD_OPENEXR=ON \
   -DCUDA_GENERATION=Auto \
   -DBUILD_NEW_PYTHON_SUPPORT=ON \
   -DWITH_CUDA=OFF \
   ..
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

#cp $CMAKE_INSTALL_PREFIX/share/OpenCV/3rdparty/lib/* $CMAKE_INSTALL_PREFIX/lib/

popd

