plugins {
    id("com.android.application")
    id("org.jetbrains.kotlin.android") // الاسم الأحدث والأكثر توافقًا
    // يجب أن يكون Flutter plugin آخر واحد
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.news_app"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = "27.2.12479018"

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = "11"
    }

    defaultConfig {
        applicationId = "com.example.news_app"
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        release {
            // يمكنك لاحقًا إضافة signingConfig خاصة بالإصدار الحقيقي
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

flutter {
    source = "../.."
}
