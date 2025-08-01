#!/usr/bin/env bash
# Copyright 2025 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -o errexit
set -o nounset
set -o pipefail

REPO_ROOT="$(git rev-parse --show-toplevel)"
cd "${REPO_ROOT}"

docker run \
  -e RUN_LOCAL=true \
  -e DEFAULT_BRANCH=main \
  -e VALIDATE_BASH=true \
  -e VALIDATE_CHECKOV=true \
  -e VALIDATE_YAML=true \
  -e VALIDATE_YAML_PRETTIER=true \
  -v "$(pwd)":/tmp/lint \
  ghcr.io/super-linter/super-linter:slim-v8.0.0
