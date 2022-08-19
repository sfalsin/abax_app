#!/bin/bash

set -eo pipefail

xcodebuild -workspace ios/Runner.xcworkspace \
            -scheme Runner\ iOS \
            -sdk iphoneos \
            -configuration AppStoreDistribution \
            -archivePath $PWD/build/Runner.xcarchive \
            clean archive | xcpretty
