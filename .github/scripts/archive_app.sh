#!/bin/bash

set -eo pipefail

xcodebuild -workspace MyApp.xcworkspace \
            -scheme MyApp\ iOS \
            -sdk iphoneos \
            -configuration Debug \
            -archivePath $PWD/build/MyApp.xcarchive \
            clean archive | xcpretty