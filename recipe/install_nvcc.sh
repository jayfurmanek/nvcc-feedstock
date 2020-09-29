#!/bin/bash
# (C) Copyright IBM Corp. 2020. All Rights Reserved.
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

set -xeuo pipefail

# Install the activate / deactivate scripts that set environment variables
mkdir -p "${PREFIX}"/etc/conda/activate.d
mkdir -p "${PREFIX}"/etc/conda/deactivate.d
cp "${RECIPE_DIR}"/../scripts/activate.sh "${PREFIX}"/etc/conda/activate.d/activate-${PKG_NAME}.sh
cp "${RECIPE_DIR}"/../scripts/deactivate.sh "${PREFIX}"/etc/conda/deactivate.d/deactivate-${PKG_NAME}.sh

# Copy `nvcc` script to `bin` so it can be easily run.
mkdir -p "${PREFIX}/bin"
cp "${RECIPE_DIR}"/../scripts/nvcc "${PREFIX}/bin"

if [[ ! -f "${CUDA_HOME}/lib64/stubs/libcuda.so" ]]
then
    echo "File ${CUDA_HOME}/lib64/stubs/libcuda.so doesn't exist"
    return 1
fi

if ! grep -q "CUDA Version ${cudatoolkit%.*}" ${CUDA_HOME}/version.txt;
then
    echo "Version of installed CUDA didn't match package"
    return 1
fi

# Add $(libcuda.so) shared object stub
# Needed for things that want to link to $(libcuda.so).
# Stub is used to avoid getting driver code linked into binaries
mkdir -p "$PREFIX/lib/stubs"
ln -s "${CUDA_HOME}/lib64/stubs/libcuda.so" "$PREFIX/lib/stubs/libcuda.so.1"
