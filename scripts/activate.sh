#!/bin/bash
# *****************************************************************
#
# Licensed Materials - Property of IBM
#
# (C) Copyright IBM Corp. 2020. All Rights Reserved.
#
# US Government Users Restricted Rights - Use, duplication or
# disclosure restricted by GSA ADP Schedule Contract with IBM Corp.
#
# *****************************************************************

if [[ ! -z "${CFLAGS+x}" ]]
then
  export CFLAGS_CONDA_NVCC_BACKUP="${CFLAGS:-}"
fi

if [[ ! -z "${CPPFLAGS+x}" ]]
then
  export CPPFLAGS_CONDA_NVCC_BACKUP="${CPPFLAGS:-}"
fi

if [[ ! -z "${CXXFLAGS+x}" ]]
then
  export CXXFLAGS_CONDA_NVCC_BACKUP="${CXXFLAGS:-}"
fi

export CFLAGS="${CFLAGS} -I${CUDA_HOME}/include"
export CPPFLAGS="${CPPFLAGS} -I${CUDA_HOME}/include"
export CXXFLAGS="${CXXFLAGS} -I${CUDA_HOME}/include"
