-keep class com.apollo.my_movies.** { *; }
-keepclassmembers class * extends io.flutter.app.FlutterFragmentActivity { *; }
-dontwarn com.apollo.my_movies.**

# Google Sign-In
-keep class com.google.android.gms.auth.** { *; }
-keep class com.google.android.gms.common.** { *; }
-dontwarn com.google.android.gms.**
