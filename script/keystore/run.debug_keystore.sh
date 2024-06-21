# keytool -genkey -v -keystore debug-key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias debug

# # ILove@CheckListApp7997
# # ChanDara Leav
# # Check List App
# # Check List App
# # Phnom Penh
# # Phnom Penh
# # KH

#!/bin/bash
cd ..
cd ..
cd android
# Variables (replace these with your desired values)
KEYSTORE_PATH="debug.keystore"
ALIAS_NAME="androiddebugkey"
KEYSTORE_PASSWORD="android"
KEY_PASSWORD="android"
BUILD_GRADLE_PATH="app/build.gradle"

# Create the debug keystore
keytool -genkey -v -keystore $KEYSTORE_PATH -keyalg RSA -keysize 2048 -validity 10000 -alias $ALIAS_NAME <<EOF
$KEYSTORE_PASSWORD
$KEY_PASSWORD
Your Name
Your Organizational Unit
Your Organization
Your City
Your State
Your Country Code
yes
EOF

# Backup the original build.gradle file
cp $BUILD_GRADLE_PATH "${BUILD_GRADLE_PATH}.bak"

# Check if the signingConfigs and debug sections already exist
if grep -q "signingConfigs" $BUILD_GRADLE_PATH; then
    echo "SigningConfigs section already exists. Please modify manually."
else
    # Append signingConfigs and buildTypes sections to build.gradle
    cat <<EOL >> $BUILD_GRADLE_PATH

android {
    signingConfigs {
        debug {
            keyAlias '$ALIAS_NAME'
            keyPassword '$KEY_PASSWORD'
            storeFile file('$KEYSTORE_PATH')
            storePassword '$KEYSTORE_PASSWORD'
        }
    }
    buildTypes {
        debug {
            signingConfig signingConfigs.debug
        }
    }
}
EOL
fi

echo "Debug keystore and build.gradle configuration completed."
