# Flutter-specific ProGuard rules
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugins.** { *; }
-keep class io.flutter.util.** { *; }
-keep class io.flutter.view.** { *; }
-keep class io.flutter.embedding.** { *; }

# Retain names of classes and members for reflection
-keepnames class * {
    public protected *;
}

-keepclassmembers class * {
    public protected *;
}

# Retain names of enum members
-keepclassmembers enum * {
    public static **[] values();
    public static ** valueOf(java.lang.String);
}

# Keep custom views with custom attributes
-keepclassmembers class * extends android.view.View {
    public void set*(android.content.Context, android.util.AttributeSet);
}

# Keep anything that uses Parcelable
-keepclassmembers class * implements android.os.Parcelable {
    static ** CREATOR;
}
