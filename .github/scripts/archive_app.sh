#!/bin/bash

set -eo pipefail

xcodebuild -workspace ios/Runner.xcworkspace \
            -allowProvisioningUpdates \
            -scheme Runner \
            -sdk iphoneos \
            -configuration AppStoreDistribution \
            -archivePath $PWD/build/Runner.xcarchive \
            clean archive | xcpretty
