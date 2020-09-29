#!/bin/bash
# (C) Copyright IBM Corp. 2018, 2020. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

if [[ -z "${CUDA_HOME}" ]]
then
  echo "CUDA_HOME is not set. Checking common places.."

  if [[ -d "/usr/local/cuda" ]]
  then
     echo "/usr/local/cuda found."
     export CUDA_HOME=/usr/local/cuda
  elif [[ -d "/usr/local/cuda-10.2" ]]
  then
     echo "/usr/local/cuda-10.2 found."
     export CUDA_HOME=/usr/local/cuda-10.2
  else
     echo "CUDA Toolkit not found."
  fi
fi

if [[ ! -f "${CUDA_HOME}/bin/nvcc" ]]
then
    echo "NVCC not found. Please install the CUDA Toolkit locally and set the CUDA_HOME environment variable."
fi

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
