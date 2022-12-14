# CheckMK Java Client

[![OpenAPI code generation](https://github.com/1and1/checkmk-java-client/actions/workflows/generate.yaml/badge.svg)](https://github.com/1and1/checkmk-java-client/actions/workflows/generate.yaml)
[![Maven Central](https://img.shields.io/maven-central/v/com.oneandone/checkmk-java-client)](https://maven-badges.herokuapp.com/maven-central/com.oneandone/checkmk-java-client)
[![javadoc](https://javadoc.io/badge2/com.oneandone/checkmk-java-client/javadoc.svg)](https://javadoc.io/doc/com.oneandone/checkmk-java-client)
[![License: GPL v2](https://img.shields.io/badge/License-GPL_v2-blue.svg)](https://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html)

A Java REST API library that connects to a [CheckMK](https://github.com/tribe29/checkmk) monitoring system server.

## What's inside

This repository contains just scripts to build the client. It does not
contain the source code that is being generated. Source code, library jar and
Javadoc is on Maven Central.

The REST client is generated using the [OpenAPI generator](https://github.com/OpenAPITools/openapi-generator)
with the target language being Java, the HTTP client being okhttp
and bean validation turned on.

## Documentation

The Java API documentation can be browsed on [Javadoc.io](https://javadoc.io/doc/com.oneandone/checkmk-java-client).

The REST API documentation can be browsed in your local Checkmk installation.

## Using the client in your code

### Maven artifact

The client is provided as a Maven artifact. By adding this dependency to your POM,
you'll be able to use the client:

```xml
  <groupId>com.oneandone</groupId>
  <artifactId>checkmk-java-client</artifactId>
  <version>$THE_VERSION_TO_USE</version>
```

For the appropriate version, please see the ["Version numbers"](#version-numbers) section below
and see [Maven Central](https://search.maven.org/search?q=g:com.oneandone%20AND%20a:checkmk-java-client)
versions.

### Demo code

A simple API client showing the [Checkmk version information](demo/src/main/java/com/ionos/network/checkmk/demo/Main.java)
is in the demo project.
It uses a custom [ApiClient](demo/src/main/java/com/ionos/network/checkmk/demo/CustomApiClient.java)
to overcome a problem in sending the Accept header.

## Generating the client code

The client code can be generated with

```bash
~ ./generate.sh
```

## Version numbers

Version numbers are composed of two parts:

1. First two segments: The generator script version.
2. Last segments: The Checkmk API version specification.

Example: Version `1.0.2.1.0.17` is composed of the parts

* `1.0` being the generator script
version, and 
* `2.1.0.17` referencing to the Checkmk API `2.1.0p17`.

## Changes compared to the generated client

There are multiple changes compared to the pure generated client. The
generated client would not build because of certain shortcomings of
OpenAPI generator.

* Replacement of [AnyOf](https://swagger.io/docs/specification/data-models/oneof-anyof-allof-not/)-based OpenAPI types with Java Map types.
  OpenAPI generator 5.4 does not natively support AnyOf-types.
* Fixing of syntactic errors, i.e. combination of `@NotNull`-annotation with type names (i.e. `@NotNullString` instead of `@NotNull String`).
* Update of several depencency versions, i.e. okhttp and gson.
* Inclusion of the SonaType OSS artifact repository into the POM.

## License

This repository is licensed under the [GPL 2.0](LICENSE) license.
