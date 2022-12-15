#! /bin/bash

set -e
SCRIPTHOME="$(cd $(dirname "$0"); pwd)"
source ${SCRIPTHOME}/settings.sh

wget --quiet https://repo1.maven.org/maven2/org/openapitools/openapi-generator-cli/${GENERATOR_VERSION}/openapi-generator-cli-${GENERATOR_VERSION}.jar -O openapi-generator-cli.jar

rm -fr src
./patch-config.sh

if [ ! -f ./openapi-doc.yaml ]; then
    echo "No OpenAPI spec found"
    echo "Files available:"
    ls -alR
    exit 5
fi

# https://openapi-generator.tech/docs/file-post-processing/
export JAVA_POST_PROCESS_FILE="${SCRIPTHOME}/java_post_process_file.sh"
mv README.md README.md.orig
java -jar ./openapi-generator-cli.jar generate \
--skip-validate-spec \
--enable-post-process-file \
--package-name com.ionos.network.checkmk \
--input-spec ./openapi-doc.yaml \
-g java \
-c ${SCRIPTHOME}/config.use.yaml
mv README.md.orig README.md

./patch-pom.sh

xmlstarlet fo < pom.xml > /tmp/t && mv /tmp/t pom.xml

xmlstarlet fo < src/main/AndroidManifest.xml > /tmp/t && mv /tmp/t src/main/AndroidManifest.xml
