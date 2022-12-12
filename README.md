# CheckMK Java Client

[![OpenAPI code generation](https://github.com/1and1/checkmk-java-client/actions/workflows/generate.yaml/badge.svg)](https://github.com/1and1/checkmk-java-client/actions/workflows/generate.yaml)
![Maven Central](https://img.shields.io/maven-central/v/com.oneandone/checkmk-java-client)
[![javadoc](https://javadoc.io/badge2/com.oneandone/checkmk-java-client/javadoc.svg)](https://javadoc.io/doc/com.oneandone/checkmk-java-client)

A Java REST API library that connects to a CheckMK monitoring system server.

## Using the client in your code

The client is provided as a Maven artifact. By adding this dependency to your POM,
you'll be able to use the client:

```xml
  <groupId>com.oneandone</groupId>
  <artifactId>checkmk-java-client</artifactId>
  <version>$THE_VERSION_TO_USE</version>
```

## Generating the client code

The client code can be generated with

```bash
~ ./generate.sh
```

## What's inside

The REST client is generated using the OpenAPI generator with the
target language being Java, the HTTP client being okhttp
and bean validation turned on.

## Documentation

The REST API documentation can be browsed on [Javadoc.io](https://javadoc.io/doc/com.oneandone/checkmk-java-client).

## License

This repository is licensed under the [GPL 2.0](LICENSE) license.
