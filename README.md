
# Excellis Travel

A flight booking app for Agents

## Project Requirement

The app is working with below configuration

`Flutter: 3.38.5`

`Dart: 3.10.4`

`Android SDK version: 36.1.0`

`Emulator version: 36.3.10.0`

`Java version: 21.0.8`






## Run Locally

Clone the project

```bash
  git clone https://github.com/jayantaex/reiselab.git
```

Go to the project directory

```bash
  cd reiselab
```

Install dependencies

```bash
  flutter pub get
```

Start the app

```bash
  flutter run --debug
```


## Release

Generate SHA Key [DEBUG]

```bash
  keytool -list -v -keystore ~/.android/debug.keystore -alias androiddebugkey -storepass android -keypass android
```

Generate Keystore file from project root directory

```bash
  keytool -genkeypair \
  -v \
  -keystore android/app/release.jks \
  -alias upload \
  -keyalg RSA \
  -keysize 2048 \
  -validity 10000
```



Setup key-properties
 
 create a key.properties file under /android with the below variables

```bash
storeFile=release.jks
storePassword=YOUR_STORE_PASSWORD
keyAlias=YOUR_RELEASE_ALIAS
keyPassword=YOUR_KEY_PASSWORD
```


Generate SHA Key [RELEASE]

```bash
  keytool -list -v -keystore android/app/release.jks -alias YOUR_RELEASE_ALIAS
```


## Firebase setup

Setup firebase for push notification. After successfully setup firebase make the variable inside the `main.dart` file `true` 

Release Apk

```bash
  flutter build apk --release
```

OR

| Flag  | Result              |
| ----- | --------------------|
| patch | 1.2.3+45 → 1.2.4+46 |
| minor | 1.2.3+45 → 1.3.0+46 |
| major | 1.2.3+45 → 2.0.0+46 |

```bash
  ./build_flutter.sh patch
```

```bash
  ./build_flutter.sh minor
```

```bash
  ./build_flutter.sh major
```


