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
￼
if [[ ! -z "${CFLAGS_CONDA_NVCC_BACKUP+x}" ]]
then
  export CFLAGS="${CFLAGS_CONDA_NVCC_BACKUP}"
  unset CFLAGS_CONDA_NVCC_BACKUP
fi

if [[ ! -z "${CPPFLAGS_CONDA_NVCC_BACKUP+x}" ]]
then
  export CPPFLAGS="${CPPFLAGS_CONDA_NVCC_BACKUP}"
  unset CPPFLAGS_CONDA_NVCC_BACKUP
fi

if [[ ! -z "${CXXFLAGS_CONDA_NVCC_BACKUP+x}" ]]
then
  export CXXFLAGS="${CXXFLAGS_CONDA_NVCC_BACKUP}"
  unset CXXFLAGS_CONDA_NVCC_BACKUP
fi
