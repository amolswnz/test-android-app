# Keytool Keystore Generation Guide

The `keytool` command needs to be run interactively. Here's how to generate your keystore:

## Method 1: Run the automated script (Recommended)

```bash
./generate-keystore.sh
```

This script will:
- Guide you through the process
- Use secure defaults
- Provide next steps
- Show important security reminders

## Method 2: Run keytool directly

```bash
keytool -genkey -v -keystore app-release-key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias release-key
```

You'll be prompted for:
1. **Keystore password** - Minimum 6 characters (store this securely!)
2. **Key password** - Can be same as keystore password
3. **Certificate information**:
   - First and Last Name
   - Organizational Unit (optional)
   - Organization (optional)
   - City or Locality
   - State or Province
   - Country Code (2 letters, e.g., US)

## Method 3: Non-interactive (for automation)

```bash
keytool -genkey -v \
  -keystore app-release-key.jks \
  -keyalg RSA \
  -keysize 2048 \
  -validity 10000 \
  -alias release-key \
  -dname "CN=Your Name, OU=Your Org Unit, O=Your Org, L=Your City, S=Your State, C=US" \
  -storepass your_store_password \
  -keypass your_key_password
```

## After Generating the Keystore

1. **Create keystore.properties**:
```bash
cp keystore.properties.example keystore.properties
```

2. **Edit keystore.properties** with your values:
```properties
storeFile=app-release-key.jks
storePassword=your_store_password
keyAlias=release-key
keyPassword=your_key_password
```

3. **Build release bundle**:
```bash
./gradlew bundleRelease
```

4. **Keep your keystore secure!**
   - Back it up to multiple locations
   - Never commit to git
   - Never share your passwords
   - You'll need it for ALL future updates

## Troubleshooting

### "Keystore password is too short"
- Use at least 6 characters for the password

### "Command not found"
- Ensure Java JDK is installed
- Check Java is in your PATH: `echo $JAVA_HOME`

### "Too many failures"
- Wait a few minutes and try again
- The security feature locks after multiple failed attempts

## Important Notes

⚠️ **SECURITY WARNING**: 
- If you lose your keystore, you cannot update your app
- Never commit keystore to version control
- Store passwords in a secure password manager
- Keep multiple backups in different locations