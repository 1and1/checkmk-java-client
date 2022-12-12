#! /bin/bash
CLEANED_OPENAPI_VERSION=$(echo $OPENAPI_VERSION | tr "p" "." )
EXTENSION=""
if [ "$SNAPSHOT" != "false" ]; then
  EXTENSION="-SNAPSHOT"
fi

awk -v OPENAPI_VERSION="${CLEANED_OPENAPI_VERSION}${EXTENSION}" < config.yaml > config.use.yaml '
/artifactVersion: .*/ { print "artifactVersion: " $2 "." OPENAPI_VERSION ; next; }
{ print $0; q}
'