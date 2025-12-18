#!/bin/bash
set -e

APP_NAME="excellisTravel"
PUBSPEC="pubspec.yaml"
BUILD_DIR="build/app/outputs"
LOG_FILE="release.log"
KEY_PROPERTIES="android/key.properties"

SEMVER_TYPE=${1:-patch}

echo "=============================="
echo " Flutter Local Release Builder"
echo "=============================="

# ----------------------------------
# 🔒 Git safety (commit required)
# ----------------------------------
if [[ -n "$(git status --porcelain)" ]]; then
  echo "❌ Uncommitted changes found."
  echo "👉 Please commit your changes before releasing."
  exit 1
fi

COMMIT_MSG=$(git log -1 --pretty=%B)

if [ -z "$COMMIT_MSG" ]; then
  echo "❌ No commit message found."
  exit 1
fi

echo "✅ Git commit verified"

# ----------------------------------
# 🔐 Keystore validation
# ----------------------------------
if [ ! -f "$KEY_PROPERTIES" ]; then
  echo "❌ android/key.properties not found"
  exit 1
fi

STORE_FILE=$(grep storeFile $KEY_PROPERTIES | cut -d'=' -f2)

if [ ! -f "android/app/$STORE_FILE" ]; then
  echo "❌ Keystore file not found: android/$STORE_FILE"
  exit 1
fi

echo "🔐 Keystore verified"

# ----------------------------------
# 🧠 Version bump
# ----------------------------------
CURRENT=$(grep "^version:" $PUBSPEC | awk '{print $2}')
NAME=${CURRENT%+*}
BUILD=${CURRENT#*+}

IFS='.' read MAJOR MINOR PATCH <<< "$NAME"

case "$SEMVER_TYPE" in
  major) MAJOR=$((MAJOR+1)); MINOR=0; PATCH=0 ;;
  minor) MINOR=$((MINOR+1)); PATCH=0 ;;
  patch) PATCH=$((PATCH+1)) ;;
  *) echo "❌ Use: major | minor | patch"; exit 1 ;;
esac

BUILD=$((BUILD+1))
NEW_VERSION="$MAJOR.$MINOR.$PATCH+$BUILD"

sed -i '' "s/^version:.*/version: $NEW_VERSION/" $PUBSPEC

echo "🚀 Version bumped: $CURRENT → $NEW_VERSION"

# ----------------------------------
# 🧹 Clean build
# ----------------------------------
flutter clean
rm -rf build/

# ----------------------------------
# 📦 Build confirmations
# ----------------------------------
read -p "Generate APK? (y/n): " BUILD_APK
read -p "Generate AAB? (y/n): " BUILD_AAB

if [ "$BUILD_APK" == "y" ]; then
  read -p "APK type (fat/split): " APK_TYPE
fi

ARTIFACTS=()

# ----------------------------------
# 📦 Build APK
# ----------------------------------
if [ "$BUILD_APK" == "y" ]; then
  if [ "$APK_TYPE" == "split" ]; then
    flutter build apk --release --split-per-abi
    for APK in $BUILD_DIR/apk/release/*.apk; do
      ABI=$(basename "$APK" | sed 's/app-release-//;s/.apk//')
      OUT="${APP_NAME}_v_${NEW_VERSION}_${ABI}.apk"
      mv "$APK" "$BUILD_DIR/apk/release/$OUT"
      ARTIFACTS+=("$BUILD_DIR/apk/release/$OUT")
    done
  else
    flutter build apk --release
    OUT="$BUILD_DIR/apk/release/${APP_NAME}_v_${NEW_VERSION}_fat.apk"
    mv "$BUILD_DIR/apk/release/app-release.apk" "$OUT"
    ARTIFACTS+=("$OUT")
  fi
fi

# ----------------------------------
# 📦 Build AAB
# ----------------------------------
if [ "$BUILD_AAB" == "y" ]; then
  flutter build appbundle --release
  AAB_OUT="$BUILD_DIR/bundle/release/${APP_NAME}_v_${NEW_VERSION}.aab"
  mv "$BUILD_DIR/bundle/release/app-release.aab" "$AAB_OUT"
  ARTIFACTS+=("$AAB_OUT")

  echo "$(date '+%Y-%m-%d %H:%M') | v$NEW_VERSION | build: $BUILD | commit: $COMMIT_MSG" >> $LOG_FILE
fi

# ----------------------------------
# 📦 GitHub Release
# ----------------------------------
TAG="v$NEW_VERSION"

gh release create "$TAG" "${ARTIFACTS[@]}" \
  --title "$TAG" \
  --notes "$COMMIT_MSG"

echo "🎉 Release completed successfully!"
