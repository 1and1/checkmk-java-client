#! /bin/bash
EXTENSION=""
if [ "$SNAPSHOT" != "false" ]; then
  EXTENSION="-SNAPSHOT"
fi

awk -v YAML_ARTIFACT_VERSION="${ARTIFACT_VERSION}${EXTENSION}" < config.yaml > config.use.yaml '
/artifactVersion: .*/ { print "artifactVersion: " YAML_ARTIFACT_VERSION ; next; }
{ print $0; q}
'