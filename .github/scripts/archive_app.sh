#!/bin/bash

set -eo pipefail

xcodebuild -resolvePackageDependencies -workspace ios/Runner.xcworkspace -scheme Runner -configuration Release
#             -sdk iphoneos \
#             -configuration AppStoreDistribution \
#             -archivePath $PWD/build/Runner.xcarchive \
#             clean archive | xcpretty
