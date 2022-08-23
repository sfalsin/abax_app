
#!/bin/bash

set -eo pipefail
#-exportOptionsPlist Runner-iOS/./\ iOS/exportOptions.plist \

xcodebuild -archivePath $PWD/build/Runner.xcarchive \
            -exportOptionsPlist ./ios/exportOptions.plist \
            -exportPath $PWD/build \
            -allowProvisioningUpdates \
            -exportArchive | xcpretty
