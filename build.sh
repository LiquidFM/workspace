#!/bin/bash
set -e

#export PATH="/media/WORKSPACE/qt/sysroot/bin:$PATH"
#export LD_LIBRARY_PATH="/media/WORKSPACE/github.com/qfm/workspace/root/install/lib"

mkdir -p staging build/foundation build/3rdparty build/core build/plugins build/fm

cd build/foundation
cmake -G "Unix Makefiles" -D CMAKE_BUILD_TYPE:STRING=$1 -DCMAKE_INSTALL_PREFIX:STRING=$(pwd)/../../staging ../../workspace/foundation
make -j8
make -j8 install

cd ../3rdparty
cmake -G "Unix Makefiles" -D CMAKE_BUILD_TYPE:STRING=$1 -DCMAKE_INSTALL_PREFIX:STRING=$(pwd)/../../staging ../../workspace/3rdparty
make -j8
make -j8 install

cd ../core
cmake -G "Unix Makefiles" -D CMAKE_BUILD_TYPE:STRING=$1 -DCMAKE_INSTALL_PREFIX:STRING=$(pwd)/../../staging ../../workspace/core
make -j8
make -j8 install

cd ../plugins
cmake -G "Unix Makefiles" -D CMAKE_BUILD_TYPE:STRING=$1 -DCMAKE_INSTALL_PREFIX:STRING=$(pwd)/../../staging ../../workspace/plugins
make -j8
make -j8 install

cd ../fm
cmake -G "Unix Makefiles" -D CMAKE_BUILD_TYPE:STRING=$1 -DCMAKE_INSTALL_PREFIX:STRING=$(pwd)/../../staging ../../workspace/fm
make -j8
make -j8 install
