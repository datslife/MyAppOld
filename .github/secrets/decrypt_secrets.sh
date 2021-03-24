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

# KEYCHAIN_PATH=$RUNNER_TEMP/build.keychain

# set -eo pipefail

# gpg --quiet --batch --yes --decrypt --passphrase="$IOS_PROFILE_KEY" --output ./.github/secrets/profile.mobileprovision ./.github/secrets/profile.mobileprovision.gpg
# gpg --quiet --batch --yes --decrypt --passphrase="$IOS_PROFILE_KEY" --output ./.github/secrets/Certificates.p12 ./.github/secrets/Certificates.p12.gpg

# mkdir -p ~/Library/MobileDevice/Provisioning\ Profiles

# cp ./.github/secrets/profile.mobileprovision ~/Library/MobileDevice/Provisioning\ Profiles/86ce4d81-fd7e-46b2-ae6a-3092b4af6cd7.mobileprovision

# security create-keychain -p "" $KEYCHAIN_PATH
# security import ./.github/secrets/Certificates.p12 -t agg -k $KEYCHAIN_PATH -P "" -A

# security list-keychains -s $KEYCHAIN_PATH
# security default-keychain -s $KEYCHAIN_PATH
# security unlock-keychain -p "" $KEYCHAIN_PATH

# security set-key-partition-list -S apple-tool:,apple: -s -k "" $KEYCHAIN_PATH

# security find-identity -v -p codesigning

# ====
# security create-keychain -p "" build.keychain
# security import ./.github/secrets/Certificates.p12 -t agg -k ~/Library/Keychains/build.keychain -P "" -A

# security list-keychains -s ~/Library/Keychains/build.keychain
# security default-keychain -s ~/Library/Keychains/build.keychain
# security unlock-keychain -p "" ~/Library/Keychains/build.keychain

# security set-key-partition-list -S apple-tool:,apple: -s -k "" ~/Library/Keychains/build.keychain


gpg --quiet --batch --yes --decrypt --passphrase="$IOS_PROFILE_KEY" --output ./.github/secrets/profile.mobileprovision ./.github/secrets/profile.mobileprovision.gpg
gpg --quiet --batch --yes --decrypt --passphrase="$IOS_PROFILE_KEY" --output ./.github/secrets/Certificates.p12 ./.github/secrets/Certificates.p12.gpg

mkdir -p ~/Library/MobileDevice/Provisioning\ Profiles

cp ./.github/secrets/profile.mobileprovision ~/Library/MobileDevice/Provisioning\ Profiles/86ce4d81-fd7e-46b2-ae6a-3092b4af6cd7.mobileprovision

# Create temporary keychain
KEYCHAIN="MyApp$$.keychain"
KEYCHAIN_PASSWORD="MyApp"
security create-keychain -p "$KEYCHAIN_PASSWORD" "$KEYCHAIN"

# Append keychain to the search list
security list-keychains -d user -s "$KEYCHAIN" $(security list-keychains -d user | sed s/\"//g)
security list-keychains

# Unlock the keychain
security set-keychain-settings "$KEYCHAIN"
security unlock-keychain -p "$KEYCHAIN_PASSWORD" "$KEYCHAIN"

# Import certificate
security import ./.github/secrets/Certificates.p12 -k "$KEYCHAIN" -P "" -T "/usr/bin/codesign"

# New requirement for MacOS 10.12+
security set-key-partition-list -S apple-tool:,apple: -s -k $KEYCHAIN_PASSWORD $KEYCHAIN
####

# security create-keychain -p "" build.keychain
# security import ./.github/secrets/Certificates.p12 -t agg -k ~/Library/Keychains/build.keychain -P "" -A

# security list-keychains -s ~/Library/Keychains/build.keychain
# security default-keychain -s ~/Library/Keychains/build.keychain
# security unlock-keychain -p "" ~/Library/Keychains/build.keychain

# security set-key-partition-list -S apple-tool:,apple: -s -k "" ~/Library/Keychains/build.keychain