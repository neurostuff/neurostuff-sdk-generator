#!/usr/bin/env bash

docker run --rm  --user $(id -u):$(id -g) \
    -v $PWD:/local openapitools/openapi-generator-cli:v5.4.0 generate \
    -i /local/neurostore-spec/neurostore-openapi.yml \
    -g python \
    -c /local/api_config.json \
    -o /local/neurostore-sdk \
    --global-property debugOperations > debug.txt
