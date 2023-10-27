#! /bin/bash

set -e
SCRIPTHOME="$(cd $(dirname "$0"); pwd)"
source ${SCRIPTHOME}/settings.sh

if [ ! -f ./openapi-doc.yaml ]; then
    echo "No OpenAPI spec found"
    echo "Files available:"
    ls -alR
    exit 5
fi

# https://openapi-generator.tech/docs/file-post-processing/
export JAVA_POST_PROCESS_FILE="${SCRIPTHOME}/java_post_process_file.sh"
mvn clean package

