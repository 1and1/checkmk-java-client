#! /bin/bash

set -e
export SNAPSHOT="false"
./generate.sh
mvn -Psonatype-oss-release clean package

echo "Artifact version: ${ARTIFACT_VERSION}"
GITTAG="checkmk-java-client-${ARTIFACT_VERSION}"
echo "Git tag: ${GITTAG}"
echo "Please confirm"
read
git tag ${GITTAG}
git push
git push --tags
mvn -Psonatype-oss-release deploy
