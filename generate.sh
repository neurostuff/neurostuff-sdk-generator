#!/usr/bin/env bash

docker run --rm  --user $(id -u):$(id -g) \
    -v $PWD:/local openapitools/openapi-generator-cli:v5.4.0 generate \
    -i /local/neurostore-spec/neurostore-openapi.yml \
    -g python \
    -c /local/neurostore_python_sdk_config.json \
    -o /local/python/neurostore-sdk \
    --global-property debugOperations > debug.txt

docker run --rm  --user $(id -u):$(id -g) \
    -v $PWD:/local openapitools/openapi-generator-cli:v5.4.0 generate \
    -i /local/neurostore-spec/analysis-specification.yml \
    -g python \
    -c /local/neurosynth_compose_python_sdk_config.json \
    -o /local/python/neurosynth-compose-sdk \
    --global-property debugOperations > debug.txt
