# Excellis Travel

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

Generate SHA Key - DEBUG :


``` keytool -list -v -keystore ~/.android/debug.keystore -alias androiddebugkey -storepass android -keypass android ```


Generate SHA Key - Release : 


``` keytool -list -v -keystore android/app/release-key.jks -alias ALIAS_NAME ```

Generate ARB Files

```flutter gen-l10n```