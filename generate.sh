#!/usr/bin/env bash

generate=$1

if [ -z ${generate} ] || [ ${generate} == "typescript-neurostore" ] || [ ${generate} == "neurostore-typescript-sdk" ]; then

    echo "generating typescript-neurostore-sdk..."
    docker run --rm  --user $(id -u):$(id -g) \
        -v $PWD:/local openapitools/openapi-generator-cli:v5.4.0 generate \
        -i /local/neurostore-spec/neurostore-openapi.yml \
        -g typescript-axios \
        -o /local/typescript/neurostore-typescript-sdk
fi

if [ -z ${generate} ] || [ ${generate} == "typescript-neurosynth-compose" ] || [ ${generate} == "neurosynth-compose-typescript-sdk" ]; then

    echo "generating typescript-neurosynth-compose-sdk..."
    docker run --rm  --user $(id -u):$(id -g) \
        -v $PWD:/local openapitools/openapi-generator-cli:v5.4.0 generate \
        -i /local/neurostore-spec/neurosynth-compose-openapi.yml \
        -g typescript-axios \
        -o /local/typescript/neurosynth-compose-typescript-sdk
fi
