#!/usr/bin/env bash

#
# Ensures that the project's network exists.
#
# The purpose of this script is to allow Docker scripts that need a network to
# leverage this script to ensure that the network exists before attempting to
# connect to it.
#

ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )/../../.." && pwd )"

. "${ROOT}"/bin/lib/env.sh
. "${ROOT}"/bin/lib/exitCheck.sh

NETWORK="${PROJECT_NAME}_default"

# ensure Docker network exists
if [ `docker network ls | grep "${NETWORK}" | wc -l | awk '{print $1}'` == 0 ]; then
  docker network create "${NETWORK}"
  exitCheck $?
fi
