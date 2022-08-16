My Set of Sourcery templates
============================

[![License](https://img.shields.io/badge/license-MIT-blue.svg?style=flat)](http://mit-license.org)
[![Test](https://github.com/tasuwo/SwiftTemplates/actions/workflows/test.yml/badge.svg)](https://github.com/tasuwo/SwiftTemplates/actions/workflows/test.yml)

[Sourcery](https://github.com/krzysztofzablocki/Sourcery) templates for generating helper methods and initializers.

## AutoDefaultValue

Template used to generate initializer with default values for all structures that are annotated with `AutoDefaultValue` annotation.

### Usage

Install [Sourcery](https://github.com/krzysztofzablocki/Sourcery) via CocoaPods. Just add a new "Run Script Phase" with:

``` shell
#!/bin/sh

VERSION="v2.0.0"

if [[ ! -f "./templates/AutoDefaultValue.swifttemplate" ]]; then
    curl -o "./templates/AutoDefaultValue.swifttemplate" \
        "https://raw.githubusercontent.com/tasuwo/SwiftTemplates/${VERSION}/Templates/AutoDefaultValue/AutoDefaultValue.swifttemplate"
fi

if [[ ! -f "./templates/AutoDefaultValue.swift" ]]; then
    curl -o "./templates/AutoDefaultValue.swift" \
        "https://raw.githubusercontent.com/tasuwo/SwiftTemplates/${VERSION}/Templates/AutoDefaultValue/AutoDefaultValue.swift"
fi

if [[ ! -f "./templates/AutoDefaultValue.extension.swift" ]]; then
    curl -o "./templates/AutoDefaultValue.extension.swift" \
        "https://raw.githubusercontent.com/tasuwo/SwiftTemplates/${VERSION}/Templates/AutoDefaultValue/AutoDefaultValue.extension.swift"
fi

if [[ -f "${PODS_ROOT}/Sourcery/bin/sourcery" ]]; then
  ${PODS_ROOT}/Sourcery/bin/sourcery --config ${PROJECT_DIR}/.sourcery.yml
else
  echo "warning: Sourcery is not installed. Run 'pod install --repo-update' to install it."
fi
```

## License

This templates is available under the MIT license. See [LICENSE](LICENSE) for more information.

