#! /bin/bash

echo "Repairing OpenAPI generated code $1"
sed --in-place \
    -e"s/@NotNull\([^ ]\)/@NotNull \1/g" \
    -e"s/AnyOf[^ ]*\(Attributemap\|Attributes\)map/java.util.Map<String, String>/" \
    -e"s/this.operator = this.getClass().getSimpleName();/this.operator = OperatorEnum.NONE_OF;/" \
    $1
