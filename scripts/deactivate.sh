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
