#!/bin/sh
export TS_POST_PROCESS_FILE="./node_modules/.bin/prettier --write"

openapi-generator-cli generate -i ../swagger/v1/openapi.yaml -g typescript-axios -o src/api -t openapi-templates/typescript-axios --enable-post-process-file
