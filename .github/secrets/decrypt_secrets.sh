# #!/bin/sh

# gpg --quiet --batch --yes --decrypt --passphrase="$IOS_PROFILE_KEY" --output ./.github/secrets/profile.mobileprovision ./.github/secrets/profile.mobileprovision.gpg
# gpg --quiet --batch --yes --decrypt --passphrase="$IOS_PROFILE_KEY" --output ./.github/secrets/Certificates.p12 ./.github/secrets/Certificates.p12.gpg

# mkdir -p ~/Library/MobileDevice/Provisioning\ Profiles

# cp ./.github/secrets/profile.mobileprovision ~/Library/MobileDevice/Provisioning\ Profiles/86ce4d81-fd7e-46b2-ae6a-3092b4af6cd7.mobileprovision

# KEYCHAIN_PATH=$RUNNER_TEMP/build.keychain

# security create-keychain -p ""> $KEYCHAIN_PATH
# # security set-keychain-settings -lut 21600 $KEYCHAIN_PATH
# # security unlock-keychain -p ""> $KEYCHAIN_PATH
# # security import Certificates.p12 -P <p12 password> -A -t cert -f pkcs12 -k $KEYCHAIN_PATH
# # security list-keychain -d user -s $KEYCHAIN_PATH
# # security create-keychain -p "" build.keychain
# security import ./.github/secrets/Certificatesp12. -t agg -k $KEYCHAIN_PATH -P "" -A

# security list-keychains -s $KEYCHAIN_PATH
# security default-keychain -s $KEYCHAIN_PATH
# security unlock-keychain -p "" $KEYCHAIN_PATH

# security set-key-partition-list -S apple-tool:,apple: -s -k "" $KEYCHAIN_PATH

KEYCHAIN_PATH=$RUNNER_TEMP/build.keychain

set -eo pipefail

gpg --quiet --batch --yes --decrypt --passphrase="$IOS_PROFILE_KEY" --output ./.github/secrets/profile.mobileprovision ./.github/secrets/profile.mobileprovision.gpg
gpg --quiet --batch --yes --decrypt --passphrase="$IOS_PROFILE_KEY" --output ./.github/secrets/Certificates.p12 ./.github/secrets/Certificates.p12.gpg

mkdir -p ~/Library/MobileDevice/Provisioning\ Profiles

cp ./.github/secrets/profile.mobileprovision ~/Library/MobileDevice/Provisioning\ Profiles/86ce4d81-fd7e-46b2-ae6a-3092b4af6cd7.mobileprovision

security create-keychain -p "" $KEYCHAIN_PATH
security import ./.github/secrets/Certificates.p12 -t agg -k $KEYCHAIN_PATH -P "" -A

security list-keychains -s $KEYCHAIN_PATH
security default-keychain -s $KEYCHAIN_PATH
security unlock-keychain -p "" $KEYCHAIN_PATH

security set-key-partition-list -S apple-tool:,apple: -s -k "" $KEYCHAIN_PATH

security find-identity -v -p codesigning