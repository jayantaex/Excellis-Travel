# Excellis Travel

A Flight boking app for Agents.

## Getting Started

Flutter: 3.38.5
Dart: 3.10.4
Android SDK version: 36.1.0
Emulator version: 36.3.10.0
Java version: 21.0.8


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


