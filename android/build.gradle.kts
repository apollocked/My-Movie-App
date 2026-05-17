allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

val newBuildDir: Directory =
    rootProject.layout.buildDirectory
        .dir("../../build")
        .get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}

// Clean reflection fix for Isar's AGP 8+ namespace requirement
subprojects {
    afterEvaluate {
        if (project.name == "isar_flutter_libs") {
            if (project.hasProperty("android")) {
                val androidExtension = project.extensions.getByName("android")
                androidExtension.javaClass.getMethod("setNamespace", String::class.java)
                    .invoke(androidExtension, "dev.isar.isar_flutter_libs")
            }
        }
    }
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
