#!/bin/sh
export TS_POST_PROCESS_FILE="./node_modules/.bin/prettier --write"


TS_POST_PROCESS_FILE="./node_modules/.bin/prettier --write" openapi-generator-cli generate -i ../swagger/v1/openapi.yaml -g typescript-axios -o openapi_client -t openapi-templates/typescript-axios --enable-post-process-file
