
#!/bin/bash

set -eo pipefail

xcodebuild -archivePath $PWD/build/Runner.xcarchive \
            -exportOptionsPlist Runner-iOS/Calculator\ iOS/exportOptions.plist \
            -exportPath $PWD/build \
            -allowProvisioningUpdates \
            -exportArchive | xcpretty
