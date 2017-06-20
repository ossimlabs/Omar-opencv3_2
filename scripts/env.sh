#!/bin/bash 
pushd `dirname $0` >/dev/null
export SCRIPT_DIR=`pwd -P`
popd >/dev/null

if [ -z $WORKSPACE ] ; then
   if [ -z "$OSSIM_DEV_HOME" ]; then
      pushd $SCRIPT_DIR/../.. >/dev/null
      export OSSIM_DEV_HOME=$PWD
      popd >/dev/null
   fi
else
   export OSSIM_DEV_HOME=$WORKSPACE
fi

pushd $SCRIPT_DIR/..
  export BUILD_DIR=$PWD/build
popd


if [ -z OSSIM_INSTALL_PREFIX ] ; then
  export OSSIM_INSTALL_PREFIX=$OSSIM_DEV_HOME/install
fi


echo "BUILD_DIR=${BUILD_DIR}"