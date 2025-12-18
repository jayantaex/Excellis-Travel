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

Release Build

```./build_flutter.sh patch```
```./build_flutter.sh minor```
```./build_flutter.sh major```

| Flag  | Result              |
| ----- | --------------------|
| patch | 1.2.3+45 → 1.2.4+46 |
| minor | 1.2.3+45 → 1.3.0+46 |
| major | 1.2.3+45 → 2.0.0+46 |


