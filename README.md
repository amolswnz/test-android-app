# Hello World Android App

A simple Android application that displays "Hello World!" on the screen.

## 📱 Features
- Displays "Hello World!" text centered on screen
- Material Design theme
- Built with Kotlin
- Supports Android 7.0+ (API 24+)

## 🚀 Getting Started

### Prerequisites
- Android Studio Hedgehog (2023.1.1) or later
- Android SDK with API 34
- JDK 8 or later

### Building the App

**Option 1: Using Android Studio**
1. Clone the repository:
   ```bash
   git clone https://github.com/amolswnz/test-android-app.git
   cd test-android-app
   ```

2. Open in Android Studio:
   - File → Open → Select the project directory

3. Build the app:
   - Build → Build Bundle(s) / APK(s) → Build APK(s)

**Option 2: Using Command Line**
1. Clone the repository:
   ```bash
   git clone https://github.com/amolswnz/test-android-app.git
   cd test-android-app
   ```

2. Build debug APK:
   ```bash
   ./gradlew assembleDebug
   ```

3. Build release APK:
   ```bash
   ./gradlew assembleRelease
   ```

4. Build release bundle (for Google Play):
   ```bash
   ./gradlew bundleRelease
   ```

The Gradle wrapper is included, so you don't need to install Gradle separately.

### Running on Emulator/Device
1. Connect your Android device or start an emulator
2. Click the Run button in Android Studio or press `Shift + F10`

## 📦 Publishing to Google Play Store

### Prerequisites
- Google Play Developer account ($25 one-time fee)
- App signing certificate

### Steps to Publish

#### 1. Generate Signed Bundle/APK

**Option 1: Using Android Studio**
```bash
# In Android Studio:
# Build → Generate Signed Bundle / APK
# Select "Android App Bundle" (recommended) or "APK"
# Create or use existing keystore
```

**Option 2: Using Command Line**
1. Run the automated keystore generation script:
   ```bash
   ./generate-keystore.sh
   ```

2. Or manually create keystore:
   ```bash
   keytool -genkey -v -keystore your-keystore.jks \
     -keyalg RSA -keysize 2048 -validity 10000 \
     -alias your-key-alias
   ```

3. Create keystore.properties file:
   ```bash
   cp keystore.properties.example keystore.properties
   # Edit keystore.properties with your actual values
   ```

4. Generate release bundle:
   ```bash
   ./gradlew bundleRelease
   ```

Output: `app/build/outputs/bundle/release/app-release.aab`

#### 2. Create Keystore (if you don't have one)
```bash
keytool -genkey -v -keystore your-keystore.jks \
  -keyalg RSA -keysize 2048 -validity 10000 \
  -alias your-key-alias
```

**Important:** Store your keystore file and passwords securely. You'll need them for future updates.

#### 3. Configure Signing in build.gradle.kts
Add signing configuration to `app/build.gradle.kts`:
```kotlin
android {
    signingConfigs {
        create("release") {
            storeFile = file("path/to/your-keystore.jks")
            storePassword = "your-store-password"
            keyAlias = "your-key-alias"
            keyPassword = "your-key-password"
        }
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("release")
            isMinifyEnabled = true
            proguardFiles(getDefaultProguardFile("proguard-android-optimize.txt"), "proguard-rules.pro")
        }
    }
}
```

#### 4. Generate Release Bundle
```bash
./gradlew bundleRelease
```
Output: `app/build/outputs/bundle/release/app-release.aab`

#### 5. Upload to Google Play Console
1. Go to [Google Play Console](https://play.google.com/console)
2. Create new app or select existing one
3. Complete all required sections:
   - Store listing (app name, description, screenshots)
   - Content rating questionnaire
   - Privacy policy URL
   - Target audience and content
   - App access
4. Upload the `.aab` file
5. Review and publish

### Testing Before Release
Use internal testing track:
1. Upload to Internal Testing
2. Create test list (add tester emails)
3. Share opt-in URL with testers

## 🛠️ Tech Stack
- **Language:** Kotlin
- **Min SDK:** 24 (Android 7.0)
- **Target SDK:** 34 (Android 14)
- **UI Framework:** ConstraintLayout
- **Theme:** Material Components

## 📄 License
This project is open source and available under the MIT License.

## 👤 Author
[amolswnz](https://github.com/amolswnz)

---

**Note:** For production apps, ensure you:
- Add proper error handling
- Implement analytics
- Add crash reporting (Firebase Crashlytics)
- Test on multiple devices and screen sizes
- Follow Material Design guidelines
- Add proper app icons for all densities