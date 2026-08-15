#! /bin/env bash
clang++ -std=c++17 -stdlib=libstdc++ -O0 -DLOCAL -x c++-header clang_dsa.h
# -DNDEBUG removed for assert
