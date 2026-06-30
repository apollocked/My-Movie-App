import java.util.Properties

plugins {
    id("com.android.application")

    // Firebase
    id("com.google.gms.google-services")
    id("com.google.firebase.crashlytics")

    id("kotlin-android")

    // Flutter plugin
    id("dev.flutter.flutter-gradle-plugin")
}

// Load keystore properties from env vars (CI) or key.properties file (local)
val keystoreProperties = Properties()
val keystorePropertiesFile = rootProject.file("key.properties")
if (keystorePropertiesFile.exists()) {
    keystoreProperties.load(keystorePropertiesFile.inputStream())
}
val storeFileProp = System.getenv("STORE_FILE") ?: keystoreProperties["storeFile"]?.toString()
val storePasswordProp = System.getenv("STORE_PASSWORD") ?: keystoreProperties["storePassword"]?.toString()
val keyAliasProp = System.getenv("KEY_ALIAS") ?: keystoreProperties["keyAlias"]?.toString()
val keyPasswordProp = System.getenv("KEY_PASSWORD") ?: keystoreProperties["keyPassword"]?.toString()

android {
    namespace = "com.example.my_movie"

    compileSdk = 36
    ndkVersion = "28.2.13676358"

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_17.toString()
    }

    defaultConfig {
        applicationId = "com.example.my_movie"

        minSdk = flutter.minSdkVersion
        targetSdk = 36

        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    packaging {
        jniLibs {
            useLegacyPackaging = false
        }
    }

    signingConfigs {
        create("release") {
            keyAlias = keyAliasProp ?: return@create
            keyPassword = keyPasswordProp ?: return@create
            storeFile = if (storeFileProp != null) file(storeFileProp) else return@create
            storePassword = storePasswordProp ?: return@create
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

            if (signingConfigs.findByName("release") != null) {
                signingConfig = signingConfigs.getByName("release")
            }
        }
    }
}

flutter {
    source = "../.."
}