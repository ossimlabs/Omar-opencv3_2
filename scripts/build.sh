#!/bin/bash 
pushd `dirname $0` >/dev/null
export SCRIPT_DIR=`pwd -P`
popd >/dev/null

source $SCRIPT_DIR/env.sh

mkdir -p $BUILD_DIR

pushd $BUILD_DIR
cmake -DCMAKE_INSTALL_PREFIX=$OSSIM_INSTALL_PREFIX ..
if [ $? != 0 ] ; then
   echo ERROR Generating CMake build files
   exit 1
fi

make -j4 install

if [ $? != 0 ] ; then
   echo ERROR Building files
   exit 1
fi

popd