#!/usr/bin/env bash

docker run --rm  \
    -v $PWD:/local openapitools/openapi-generator-cli:v5.4.0 generate \
    -i /local/neurostore-spec/neurostore-openapi.yml \
    -g python \
    -c /local/api_config.json \
    -t /local/templates/ \
    -o /local/neurostore-api
