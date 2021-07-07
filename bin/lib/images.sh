#!/usr/bin/env bash

export PHP_ACCOUNT=chekote
export PHP_REPO=php
if [ -z "${USE_PHP5}" ]; then
    export PHP_TAG=7.2.34.d-behat3.4
else
    export PHP_TAG=5.6.40.a-behat3.4
fi

export SED_REPO=alpine
export SED_TAG=3.8
