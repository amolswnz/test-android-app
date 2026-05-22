#!/bin/bash

# Keystore Generation Script for Android App
# This script helps you generate a keystore for signing your Android app

echo "=========================================="
echo "Android App Keystore Generator"
echo "=========================================="
echo ""

# Check if keytool is available
if ! command -v keytool &> /dev/null; then
    echo "Error: keytool not found. Please ensure Java JDK is installed and in your PATH."
    exit 1
fi

# Default values
KEYSTORE_NAME="app-release-key.jks"
KEY_ALIAS="release-key"
KEY_SIZE=2048
VALIDITY_DAYS=10000

echo "Keystore Configuration:"
echo "------------------------"
echo "Keystore file: $KEYSTORE_NAME"
echo "Key alias: $KEY_ALIAS"
echo "Key size: $KEY_SIZE bits"
echo "Validity: $VALIDITY_DAYS days"
echo ""

# Check if keystore already exists
if [ -f "$KEYSTORE_NAME" ]; then
    read -p "Keystore already exists. Overwrite? (y/N): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "Keystore generation cancelled."
        exit 0
    fi
    rm "$KEYSTORE_NAME"
fi

echo "Important Notes:"
echo "----------------"
echo "1. Store passwords securely - you'll need them for all future app updates"
echo "2. Use a strong keystore password (at least 6 characters)"
echo "3. Use a different password for the key"
echo "4. Keep multiple backups of the keystore file"
echo "5. NEVER commit the keystore to version control"
echo ""

# Generate the keystore
echo "Generating keystore..."
echo "You'll be prompted to enter:"
echo "  - Keystore password (store password)"
echo "  - Key password (can be same as store password)"
echo "  - Certificate information (name, organization, etc.)"
echo ""

keytool -genkey -v \
    -keystore "$KEYSTORE_NAME" \
    -keyalg RSA \
    -keysize "$KEY_SIZE" \
    -validity "$VALIDITY_DAYS" \
    -alias "$KEY_ALIAS"

if [ $? -eq 0 ]; then
    echo ""
    echo "=========================================="
    echo "✅ Keystore generated successfully!"
    echo "=========================================="
    echo ""
    echo "Keystore location: $KEYSTORE_NAME"
    echo ""
    echo "IMPORTANT SECURITY NOTES:"
    echo "-------------------------"
    echo "1. Remember your passwords - they cannot be recovered"
    echo "2. Back up this keystore file to multiple secure locations"
    echo "3. Never share your keystore or passwords"
    echo "4. Add keystore file to .gitignore"
    echo ""
    echo "Next steps:"
    echo "-----------"
    echo "1. Create keystore.properties file:"
    echo "   cp keystore.properties.example keystore.properties"
    echo ""
    echo "2. Edit keystore.properties with your values:"
    echo "   storeFile=$KEYSTORE_NAME"
    echo "   storePassword=YOUR_STORE_PASSWORD"
    echo "   keyAlias=$KEY_ALIAS"
    echo "   keyPassword=YOUR_KEY_PASSWORD"
    echo ""
    echo "3. Build release bundle:"
    echo "   ./gradlew bundleRelease"
    echo ""
else
    echo ""
    echo "❌ Keystore generation failed."
    echo "Please try again or check the error messages above."
    exit 1
fi