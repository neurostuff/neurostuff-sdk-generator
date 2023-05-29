#!/usr/bin/env bash

generate=$1

if [ -z ${generate} ] || [ ${generate} == "python-neurostore" ] || [ ${generate} == "neurostore-python-sdk" ]; then

    echo "generating python-neurostore-sdk..."
    docker run --rm  --user $(id -u):$(id -g) \
        -v $PWD:/local openapitools/openapi-generator-cli:706452c26389 generate \
        -i /local/neurostore-spec/neurostore-openapi.yml \
        -g python \
        -c /local/neurostore_python_nextgen_sdk_config.json \
        -o /local/python/neurostore-python-sdk
fi

if [ -z ${generate} ] || [ ${generate} == "typescript-neurostore" ] || [ ${generate} == "neurostore-typescript-sdk" ]; then

    echo "generating typescript-neurostore-sdk..."
    docker run --rm  --user $(id -u):$(id -g) \
        -v $PWD:/local openapitools/openapi-generator-cli:v6.6.0 generate \
        -i /local/neurostore-spec/neurostore-openapi.yml \
        -g typescript-axios \
        -o /local/typescript/neurostore-typescript-sdk
fi

if [ -z ${generate} ] || [ ${generate} == "python-neurosynth-compose" ] || [ ${generate} == "neurosynth-compose-python-sdk" ]; then

    echo "generating python-neurosynth-compose-sdk..."
    docker run --rm  --user $(id -u):$(id -g) \
        -v $PWD:/local openapitools/openapi-generator-cli:706452c26389 generate \
        -i /local/neurostore-spec/neurosynth-compose-openapi.yml \
        -g python \
        -c /local/neurosynth_compose_python_nextgen_sdk_config.json \
        -o /local/python/neurosynth-compose-python-sdk
fi

if [ -z ${generate} ] || [ ${generate} == "typescript-neurosynth-compose" ] || [ ${generate} == "neurosynth-compose-typescript-sdk" ]; then

    echo "generating typescript-neurosynth-compose-sdk..."
    docker run --rm  --user $(id -u):$(id -g) \
        -v $PWD:/local openapitools/openapi-generator-cli:v6.6.0 generate \
        -i /local/neurostore-spec/neurosynth-compose-openapi.yml \
        -g typescript-axios \
        -o /local/typescript/neurosynth-compose-typescript-sdk
fi
