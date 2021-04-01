#!/bin/bash

mkdir -p build/
cmake -B build/ -G "Unix Makefiles" -DEXECUTABLE_NAME=$1
cmake --build build/

