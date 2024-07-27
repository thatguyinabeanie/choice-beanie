#!/bin/sh
export TS_POST_PROCESS_FILE="./node_modules/.bin/prettier --write"

openapi-generator-cli generate -i swagger/v1/openapi.yaml -g typescript-axios -o nextjs/src/api -t nextjs/openapi-templates/typescript-axios --enable-post-process-file
