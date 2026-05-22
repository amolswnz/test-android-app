# Build Issues with Java 26

You're using Java 26.0.1, which is too new for current Android development tools.

## Solution: Use Android Studio

### Recommended Approach
The easiest way to build and run this Android app is to use **Android Studio**:

1. **Install Android Studio** if you haven't already:
   - Download from https://developer.android.com/studio
   - It includes the correct Java version and Android SDK

2. **Open the project in Android Studio**:
   ```bash
   # Navigate to project directory
   cd test-andriod-app
   
   # Open with Android Studio (macOS)
   open -a "Android Studio" .
   
   # Or double-click the project folder in Android Studio
   ```

3. **Let Android Studio sync and download dependencies**

4. **Build and run**:
   - Click the green ▶️ Run button
   - Or press `Shift + F10`
   - Or use: `Build → Build Bundle(s) / APK(s) → Build APK(s)`

### Alternative: Use Android Studio Command Line

If you want to use command-line tools, use the ones included with Android Studio:

```bash
# Find Android Studio installation
# On macOS, it's typically: /Applications/Android\ Studio.app

# Use the Gradle wrapper provided by Android Studio
# It will use the correct Java version
./gradlew assembleDebug
```

### Why This Happens

- **Java 26** is a very new release
- **Android Gradle Plugin** currently supports up to Java 21
- **Kotlin** also has Java version compatibility requirements
- **Android Studio** bundles the correct Java version (typically Java 17)

### Quick Fix for Command Line (Advanced)

If you really want to build from command line:

1. **Install Java 17**:
   ```bash
   brew install openjdk@17
   ```

2. **Set JAVA_HOME**:
   ```bash
   export JAVA_HOME=$(/usr/libexec/java_home -v 17)
   ```

3. **Then build**:
   ```bash
   ./gradlew assembleDebug
   ```

## Summary

**Use Android Studio** - it handles all the Java version compatibility issues automatically and provides the best development experience for Android apps.

Your project is ready and correct. The issue is just the Java version on your system.