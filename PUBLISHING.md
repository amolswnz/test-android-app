# Google Play Store Publishing Guide

## Prerequisites Checklist
- [ ] Google Play Developer account ($25 one-time fee)
- [ ] App signing certificate (keystore)
- [ ] App name and description
- [ ] App icons (512x512 high-res icon, various sizes)
- [ ] Screenshots (at least 2, phone and 7-inch tablet)
- [ ] Privacy policy URL
- [ ] Email address for support

## Step-by-Step Publishing Process

### Step 1: Create Google Play Developer Account
1. Go to [Google Play Console](https://play.google.com/console)
2. Sign in with your Google account
3. Pay $25 registration fee (one-time)
4. Complete registration details

### Step 2: Generate Signed App Bundle

#### Option A: Using Android Studio
1. **Build → Generate Signed Bundle / APK**
2. Select **Android App Bundle** (recommended)
3. **Create new keystore** or use existing:
   - Click "Create new..."
   - Set keystore path (e.g., `app-release-key.jks`)
   - Set passwords (store and key)
   - Set alias (e.g., `release-key`)
   - Fill in certificate information
4. Select **release** build variant
5. Click **Finish**

Output: `app/build/outputs/bundle/release/app-release.aab`

#### Option B: Using Command Line
```bash
# Generate keystore
keytool -genkey -v -keystore app-release-key.jks \
  -keyalg RSA -keysize 2048 -validity 10000 \
  -alias release-key

# Build signed bundle
./gradlew bundleRelease
```

### Step 3: Create App in Play Console

1. **Create App**
   - Click "Create app"
   - Enter app name: "Hello World"
   - Select app type: "Game" or "App"
   - Select "Free" or "Paid"
   - Select "No ads" if applicable
   - Click "Create app"

2. **Dashboard Overview**
   Complete all required sections (marked with !)

### Step 4: Complete Store Listing

#### Main Store Listing
- **App name:** Hello World
- **Short description:** A simple Hello World Android app (max 80 characters)
- **Full description:** 
  ```
  A simple Android application that displays "Hello World!" on the screen.
  Perfect for beginners learning Android development or as a template for new projects.
  
  Features:
  - Clean, minimalist design
  - Material Design theme
  - Centered text display
  - Supports Android 7.0 and above
  ```

#### Graphic Assets
- **App icon:** 512x512 PNG, no transparency
- **Feature graphic:** 1024x500 PNG (optional)
- **Screenshots:** Phone (at least 2), 7-inch tablet (optional)

### Step 5: Privacy Policy
Create a simple privacy policy and host it (GitHub Pages, etc.):

```
Privacy Policy for Hello World App

Last updated: [Date]

This app does not collect, store, or transmit any personal information.

Data Collection:
- No personal data is collected
- No usage analytics are tracked
- No third-party services are used

Permissions:
- This app does not require any special permissions

Contact:
For questions, contact: [your-email@example.com]
```

### Step 6: Content Rating
1. Complete the content rating questionnaire
2. Select target audience (everyone)
3. Get content rating

### Step 7: Release Setup

#### Release Channels
1. **Internal Testing** (recommended first)
   - Upload your `.aab` file
   - Add tester email addresses
   - Get opt-in URL to share
   - Test thoroughly

2. **Closed Testing** (optional)
   - Create testing track
   - Add more testers
   - Collect feedback

3. **Open Testing** (optional)
   - Make available to broader audience
   - Collect more feedback

4. **Production Release**
   - Final testing complete
   - Create production release
   - Upload `.aab` file
   - Set release notes
   - Submit for review

### Step 8: Review and Release

#### Review Process
- Google reviews your app (usually 1-7 days)
- Check email for review status
- Address any issues raised

#### Release Options
- **Scheduled:** Set specific date/time
- **Staged rollout:** Release to percentage of users (5%, 10%, etc.)
- **Complete rollout:** Release to all users immediately

## Important Notes

### Keystore Security
- **Never** commit keystore to version control
- **Never** share keystore passwords
- **Keep multiple backups** in secure locations
- **You cannot update your app** without the original keystore

### App Signing
- Google manages app signing by default (recommended)
- Or manage your own key (advanced)

### Updates
- Increment `versionCode` in `build.gradle.kts`
- Update `versionName` for display
- Follow same signing process
- Submit new release

## Quick Reference Commands

```bash
# Generate keystore
keytool -genkey -v -keystore app-release-key.jks \
  -keyalg RSA -keysize 2048 -validity 10000 \
  -alias release-key

# Build debug APK
./gradlew assembleDebug

# Build release APK
./gradlew assembleRelease

# Build release bundle
./gradlew bundleRelease

# Install debug APK to device
adb install app/build/outputs/apk/debug/app-debug.apk

# Check signature
keytool -printcert -jarfile app-release.aab
```

## Troubleshooting

### Common Issues

1. **"Upload failed"**
   - Check file size (max 150MB for AAB)
   - Verify package name matches
   - Check versionCode hasn't been used

2. **"App signing error"**
   - Verify keystore password
   - Check alias name
   - Ensure key password is correct

3. **"Content rating issues"**
   - Complete all questionnaire items
   - Answer truthfully about app content

4. **"Permission denied"**
   - Check AndroidManifest.xml permissions
   - Document why permissions are needed

## Next Steps After Publishing

1. **Monitor Analytics**
   - Set up Firebase Analytics
   - Track user engagement
   - Monitor crash reports

2. **Gather Feedback**
   - Read user reviews
   - Respond to feedback
   - Implement improvements

3. **Update Regularly**
   - Fix bugs
   - Add features
   - Update for new Android versions

## Resources

- [Google Play Console Help](https://support.google.com/googleplay/android-developer)
- [Android App Bundle Guide](https://developer.android.com/guide/app-bundle)
- [Material Design Guidelines](https://material.io/design)
- [Android Publishing Checklist](https://developer.android.com/studio/publish)