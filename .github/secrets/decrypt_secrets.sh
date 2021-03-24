# #!/bin/sh
# https://zach.codes/ios-builds-using-github-actions-without-fastlane/

gpg --quiet --batch --yes --decrypt --passphrase="$IOS_PROFILE_KEY" --output ./.github/secrets/profile.mobileprovision ./.github/secrets/profile.mobileprovision.gpg
gpg --quiet --batch --yes --decrypt --passphrase="$IOS_PROFILE_KEY" --output ./.github/secrets/Certificates.p12 ./.github/secrets/Certificates.p12.gpg

mkdir -p ~/Library/MobileDevice/Provisioning\ Profiles

cp ./.github/secrets/profile.mobileprovision ~/Library/MobileDevice/Provisioning\ Profiles/86ce4d81-fd7e-46b2-ae6a-3092b4af6cd7.mobileprovision

# Create temporary keychain
# I added the $$ which is the PID.
# This means we allow can parallelize the script by allowing multiple temporary keychains to be created concurrently
KEYCHAIN="MyApp$$.keychain"
KEYCHAIN_PASSWORD="MyApp"

# Create your build Keychain. This will contain the private key/certificate used for codesigning
# The keychain_password is up to you. You'll use this later to unlock the keychain during the build.
security create-keychain -p "$KEYCHAIN_PASSWORD" "$KEYCHAIN"

# Append keychain to the search list
# Be careful to use security list-keychains -s to append your keychain,
# else, you will clobber builds running in another thread
security list-keychains -d user -s "$KEYCHAIN" $(security list-keychains -d user | sed s/\"//g)
security list-keychains

# Unlocks temporary keychain with no automatic relocking timeout
security set-keychain-settings "$KEYCHAIN"
# Unlock the keychain
security unlock-keychain -p "$KEYCHAIN_PASSWORD" "$KEYCHAIN"

# Import the private key/certificate (*.p12) for your CodeSign identity
# The key here is the "-A" flag.
# This will allow access to the keychain without warning.
# This is why you're seeing the "User interaction is not allowed" error.
# If you were attempting this build via the Xcode UI,
# this is the point where it would prompt you to "Allow access" to your keychain.
# security import ./.github/secrets/Certificates.p12 -k "$KEYCHAIN" -P "" -T "/usr/bin/codesign"
security import ./.github/secrets/Certificates.p12 -t agg -k $KEYCHAIN -P "" -A

# New requirement for MacOS 10.12+
security set-key-partition-list -S apple-tool:,apple: -s -k $KEYCHAIN_PASSWORD $KEYCHAIN
