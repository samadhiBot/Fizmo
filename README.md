# Fizmo

> Fizmo: Cause stopped-up pipes to unclog

## Overview

Fizmo is a library containing Swift implementations of [Z-code built-in functions](https://docs.google.com/document/d/11Kz3tknK05hb0Cw41HmaHHkgR9eh0qNLAbE9TzZe--c/edit#heading=h.1j4nfs6) in support of [Quelbo](https://github.com/samadhiBot/Quelbo) [ZIL](https://www.ifwiki.org/ZIL)->[Swift](https://docs.swift.org/swift-book/) code translations.

## Usage

To install via Swift Package Manager, add `Fizmo` as a dependency to your `Package.swift` file. For more information, please see the [Swift Package Manager documentation](https://github.com/apple/swift-package-manager/tree/master/Documentation).

```swift
.package(url: "https://github.com/samadhiBot/Fizmo", from: "0.1.0")
```

Running Quelbo with a specified `--target` option generates a Swift package with the Fizmo dependency defined. 
