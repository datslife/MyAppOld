# #!/bin/sh

gpg --quiet --batch --yes --decrypt --passphrase="$IOS_PROFILE_KEY" --output ./.github/secrets/profile.mobileprovision ./.github/secrets/profile.mobileprovision.gpg
gpg --quiet --batch --yes --decrypt --passphrase="$IOS_PROFILE_KEY" --output ./.github/secrets/Certificates.p12 ./.github/secrets/Certificates.p12.gpg

mkdir -p ~/Library/MobileDevice/Provisioning\ Profiles

cp ./.github/secrets/profile.mobileprovision ~/Library/MobileDevice/Provisioning\ Profiles/86ce4d81-fd7e-46b2-ae6a-3092b4af6cd7.mobileprovision

# Create temporary keychain
KEYCHAIN="MyApp$$.keychain"
KEYCHAIN_PASSWORD="MyApp"

# Create your build Keychain. This will contain the private key/certificate used for codesigning
# The keychain_password is up to you. You'll use this later to unlock the keychain during the build.
security create-keychain -p "$KEYCHAIN_PASSWORD" "$KEYCHAIN"

# Append keychain to the search list
security list-keychains -d user -s "$KEYCHAIN" $(security list-keychains -d user | sed s/\"//g)
security list-keychains

# Unlock the keychain
security set-keychain-settings "$KEYCHAIN"
security unlock-keychain -p "$KEYCHAIN_PASSWORD" "$KEYCHAIN"

# Import certificate
# security import ./.github/secrets/Certificates.p12 -k "$KEYCHAIN" -P "" -T "/usr/bin/codesign"
security import ./.github/secrets/Certificates.p12 -t agg -k "$KEYCHAIN" -P "$KEYCHAIN_PASSWORD" -A

# New requirement for MacOS 10.12+
security set-key-partition-list -S apple-tool:,apple: -s -k $KEYCHAIN_PASSWORD $KEYCHAIN
