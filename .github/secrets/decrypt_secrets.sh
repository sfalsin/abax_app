#!/bin/sh
set -eo pipefail

gpg --quiet --batch --yes --decrypt --passphrase="$IOS_KEYS" --output ./.github/secrets/YOUR_PROFILE.mobileprovision ./.github/secrets/YOUR_PROFILE.gpg
gpg --quiet --batch --yes --decrypt --passphrase="$IOS_KEYS" --output ./.github/secrets/YOUR_CERTIFICATE.p12 ./.github/secrets/YOUR_CERTIFICATE.gpg

mkdir -p ~/Library/MobileDevice/Provisioning\ Profiles

cp ./.github/secrets/YOUR_PROFILE.mobileprovision ~/Library/MobileDevice/Provisioning\ Profiles/YOUR_PROFILE.mobileprovision


security create-keychain -p "hezq-ezxm-rdln-whyg" build.keychain
security import ./.github/secrets/YOUR_CERTIFICATE.p12 -t agg -k ~/Library/Keychains/build.keychain -P "hezq-ezxm-rdln-whyg" -A

security list-keychains -s ~/Library/Keychains/build.keychain
security default-keychain -s ~/Library/Keychains/build.keychain
security unlock-keychain -p "hezq-ezxm-rdln-whyg" ~/Library/Keychains/build.keychain

security set-key-partition-list -S apple-tool:,apple: -s -k "hezq-ezxm-rdln-whyg" ~/Library/Keychains/build.keychain

for PROVISION in `ls ./.github/secrets/*.mobileprovision`
do
  UUID=`/usr/libexec/PlistBuddy -c 'Print :UUID' /dev/stdin <<< $(security cms -D -i ./$PROVISION)`
  cp "./$PROVISION" "$HOME/Library/MobileDevice/Provisioning Profiles/$UUID.mobileprovision"
done