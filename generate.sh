#!/usr/bin/env bash

generate=$1

if [ -z ${generate} ] || [ ${generate} == "python-neurostore" ] || [ ${generate} == "neurostore-python-sdk" ]; then

    echo "generating python-neurostore-sdk..."
    docker run --rm  --user $(id -u):$(id -g) \
        -v $PWD:/local openapitools/openapi-generator-cli:v5.4.0 generate \
        -i /local/neurostore-spec/neurostore-openapi.yml \
        -g python \
        -c /local/neurostore_python_sdk_config.json \
        -o /local/python/neurostore-sdk
fi

if [ -z ${generate} ] || [ ${generate} == "typescript-neurostore" ] || [ ${generate} == "neurostore-typescript-sdk" ]; then

    echo "generating typescript-neurostore-sdk..."
    docker run --rm  --user $(id -u):$(id -g) \
        -v $PWD:/local openapitools/openapi-generator-cli:v5.4.0 generate \
        -i /local/neurostore-spec/neurostore-openapi.yml \
        -g typescript-axios \
        -o /local/typescript/neurostore-sdk
fi

if [ -z ${generate} ] || [ ${generate} == "python-neurosynth-compose" ] || [ ${generate} == "neurosynth-compose-python-sdk" ]; then

    echo "generating python-neurosynth-compose-sdk..."
    docker run --rm  --user $(id -u):$(id -g) \
        -v $PWD:/local openapitools/openapi-generator-cli:v5.4.0 generate \
        -i /local/neurostore-spec/analysis-specification.yml \
        -g python \
        -c /local/neurosynth_compose_python_sdk_config.json \
        -o /local/python/neurosynth-compose-sdk
fi

if [ -z ${generate} ] || [ ${generate} == "typescript-neurosynth-compose" ] || [ ${generate} == "neurosynth-compose-typescript-sdk" ]; then

    echo "generating typescript-neurosynth-compose-sdk..."
    docker run --rm  --user $(id -u):$(id -g) \
        -v $PWD:/local openapitools/openapi-generator-cli:v5.4.0 generate \
        -i /local/neurostore-spec/analysis-specification.yml \
        -g typescript-axios \
        -o /local/typescript/neurosynth-compose-sdk
fi
