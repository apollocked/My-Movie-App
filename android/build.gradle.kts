buildscript {
    repositories {
        google()
        mavenCentral()
    }

    dependencies {
        classpath("com.google.gms:google-services:4.4.3")
        classpath("com.google.firebase:firebase-crashlytics-gradle:3.0.1")
    }
}

allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

// Redirect build directories away from workspace root
val newBuildDir: Directory = rootProject.layout.buildDirectory
    .dir("../../build")
    .get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}

// Subproject evaluation block for plugin fixes and SDK enforcement
subprojects {
    afterEvaluate {
        // 1. Clean reflection fix for Isar's AGP 8+ namespace requirement
        if (project.name == "isar_flutter_libs") {
            if (project.hasProperty("android")) {
                val androidExtension = project.extensions.getByName("android")
                try {
                    androidExtension.javaClass.getMethod("setNamespace", String::class.java)
                        .invoke(androidExtension, "dev.isar.isar_flutter_libs")
                } catch (e: Exception) {
                    // Fail-safe fallback if namespace assignment changes
                }
            }
        }

        // 2. Safely forces compileSdkVersion/compileSdk to 36 across all plugins
        if (project.hasProperty("android")) {
            val androidExtension = project.extensions.getByName("android")
            
            // Try modern compileSdk setter first
            try {
                androidExtension.javaClass.getMethod("setCompileSdk", Integer::class.java)
                    .invoke(androidExtension, 36)
            } catch (e: Exception) {
                // Try legacy compileSdkVersion setter
                try {
                    androidExtension.javaClass.getMethod("setCompileSdkVersion", Object::class.java)
                        .invoke(androidExtension, 36)
                } catch (ex: Exception) {
                    // Fail silently if neither signature matches
                }
            }
        }
    }
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}