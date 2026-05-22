plugins {
    id("com.android.application")
    id("org.jetbrains.kotlin.android")
    // Load keystore properties for release builds
    val keystorePropertiesFile = rootProject.file("keystore.properties")
    if (keystorePropertiesFile.exists()) {
        val keystoreProperties = java.util.Properties()
        keystoreProperties.load(keystorePropertiesFile.inputStream())
        extra["storeFile"] = keystoreProperties["storeFile"]
        extra["storePassword"] = keystoreProperties["storePassword"]
        extra["keyAlias"] = keystoreProperties["keyAlias"]
        extra["keyPassword"] = keystoreProperties["keyPassword"]
    }
}

android {
    namespace = "com.example.helloworld"
    compileSdk = 34

    defaultConfig {
        applicationId = "com.example.helloworld"
        minSdk = 24
        targetSdk = 34
        versionCode = 1
        versionName = "1.0"
    }

    signingConfigs {
        create("release") {
            if (extra.has("storeFile")) {
                storeFile = file(extra["storeFile"] as String)
                storePassword = extra["storePassword"] as String
                keyAlias = extra["keyAlias"] as String
                keyPassword = extra["keyPassword"] as String
            }
        }
    }

    buildTypes {
        release {
            isMinifyEnabled = true
            isShrinkResources = true
            proguardFiles(
                getDefaultProguardFile("proguard-android-optimize.txt"),
                "proguard-rules.pro"
            )
            // Use signing config if available, otherwise debug signing
            if (extra.has("storeFile")) {
                signingConfig = signingConfigs.getByName("release")
            }
        }
        debug {
            isDebuggable = true
            applicationIdSuffix = ".debug"
        }
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_1_8
        targetCompatibility = JavaVersion.VERSION_1_8
    }

    kotlinOptions {
        jvmTarget = "1.8"
    }
}

dependencies {
    implementation("androidx.core:core-ktx:1.12.0")
    implementation("androidx.appcompat:appcompat:1.6.1")
    implementation("com.google.android.material:material:1.11.0")
    implementation("androidx.constraintlayout:constraintlayout:2.1.4")
}