#! /bin/bash

VERSION=$1
if [ "x$VERSION" = "x" ]; then
    echo "First argument needs to be the CMK version, i.e. 2.2.0p13"
    exit 1
fi

find .github/workflows -iname "*.yaml" -type f | while read FILE; do
    echo "Processing $FILE"
    sed -i -e"s/\(cmk_version:\)\([[:space:]]*\)\([0-9p.]\{3,\}\)$/\1 $VERSION/g" $FILE
done

echo "Processing settings.sh"
sed -i -e"s/\(OPENAPI_VERSION=\)\([0-9p.]\{3,\}\)$/\1$VERSION/g" settings.sh
