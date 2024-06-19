#!/bin/bash
cd ..
cd ..
# Create directories
mkdir -p android/fastlane/metadata/android/en-US
mkdir -p android/fastlane/metadata/android/en-US/images/phoneScreenshots
mkdir -p android/fastlane/metadata/android/en-US/images/sevenInchScreenshots
mkdir -p android/fastlane/metadata/android/en-US/images/tenInchScreenshots
mkdir -p android/fastlane/metadata/android/en-US/images/tvScreenshots
mkdir -p android/fastlane/metadata/android/en-US/images/wearScreenshots

# Create metadata files
echo "Your App Title" > android/fastlane/metadata/android/en-US/title.txt
echo "A short description of your app." > android/fastlane/metadata/android/en-US/short_description.txt
echo "A full, detailed description of your app." > android/fastlane/metadata/android/en-US/full_description.txt
echo "Changelog for the new version." > android/fastlane/metadata/android/en-US/changelog.txt
echo "Your privacy policy link or text." > android/fastlane/metadata/android/en-US/privacy_policy.txt

# Create image placeholders
touch android/fastlane/metadata/android/en-US/images/icon.png
touch android/fastlane/metadata/android/en-US/images/featureGraphic.png
touch android/fastlane/metadata/android/en-US/images/phoneScreenshots/phoneScreenshot1.png
touch android/fastlane/metadata/android/en-US/images/phoneScreenshots/phoneScreenshot2.png
touch android/fastlane/metadata/android/en-US/images/phoneScreenshots/phoneScreenshot3.png
touch android/fastlane/metadata/android/en-US/images/sevenInchScreenshots/tabletScreenshot1.png
touch android/fastlane/metadata/android/en-US/images/sevenInchScreenshots/tabletScreenshot2.png
touch android/fastlane/metadata/android/en-US/images/tenInchScreenshots/tabletScreenshot1.png
touch android/fastlane/metadata/android/en-US/images/tenInchScreenshots/tabletScreenshot2.png
touch android/fastlane/metadata/android/en-US/images/tvScreenshots/tvScreenshot1.png
touch android/fastlane/metadata/android/en-US/images/tvScreenshots/tvScreenshot2.png
touch android/fastlane/metadata/android/en-US/images/wearScreenshots/wearScreenshot1.png
touch android/fastlane/metadata/android/en-US/images/wearScreenshots/wearScreenshot2.png

echo "✨🍀Create Directory and File successfully✨🍀"