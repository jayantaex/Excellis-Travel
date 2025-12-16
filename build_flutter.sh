#!/bin/bash
set -e

APP_NAME="excellisTravel"
PUBSPEC="pubspec.yaml"
BUILD_DIR="build/app/outputs"
LOG_FILE="release.log"
KEY_PROPERTIES="android/key.properties"

SEMVER_TYPE=${1:-patch}
CI_MODE=${CI:-false}

echo "=============================="
echo " Flutter Production Builder"
echo "=============================="

# ----------------------------------
# 🔒 Git safety checks
# ----------------------------------
if [[ -n "$(git status --porcelain)" ]]; then
  echo "❌ Git working tree is dirty. Commit changes first."
  exit 1
fi

git fetch

LOCAL=$(git rev-parse @)
REMOTE=$(git rev-parse @{u})

if [ "$LOCAL" != "$REMOTE" ]; then
  echo "❌ Git branch not pushed. Push commits before release."
  exit 1
fi

COMMIT_MSG=$(git log -1 --pretty=%B)

# ----------------------------------
# 🔐 Keystore validation
# ----------------------------------
if [ ! -f "$KEY_PROPERTIES" ]; then
  echo "❌ key.properties not found"
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
  *) echo "❌ Invalid version flag"; exit 1 ;;
esac

BUILD=$((BUILD+1))
NEW_VERSION="$MAJOR.$MINOR.$PATCH+$BUILD"

sed -i '' "s/^version:.*/version: $NEW_VERSION/" $PUBSPEC

echo "🚀 Version bumped: $CURRENT → $NEW_VERSION"

# ----------------------------------
# 🧹 Clean
# ----------------------------------
flutter clean
rm -rf build/

# ----------------------------------
# 🤖 CI / Local config
# ----------------------------------
if [ "$CI_MODE" = "true" ]; then
  BUILD_APK=${BUILD_APK:-true}
  BUILD_AAB=${BUILD_AAB:-true}
  APK_TYPE=${APK_TYPE:-fat}
else
  read -p "Generate APK? (y/n): " BUILD_APK
  read -p "Generate AAB? (y/n): " BUILD_AAB
  if [ "$BUILD_APK" == "y" ]; then
    read -p "APK type (fat/split): " APK_TYPE
  fi
fi

# ----------------------------------
# 📦 Build APK
# ----------------------------------
ARTIFACTS=()

if [[ "$BUILD_APK" == "y" || "$BUILD_APK" == "true" ]]; then
  if [ "$APK_TYPE" == "split" ]; then
    flutter build apk --release --split-per-abi
    for APK in $BUILD_DIR/apk/release/*.apk; do
      ABI=$(basename "$APK" | sed 's/app-release-//;s/.apk//')
      NAME_OUT="${APP_NAME}_v_${NEW_VERSION}_${ABI}.apk"
      mv "$APK" "$BUILD_DIR/apk/release/$NAME_OUT"
      ARTIFACTS+=("$BUILD_DIR/apk/release/$NAME_OUT")
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
if [[ "$BUILD_AAB" == "y" || "$BUILD_AAB" == "true" ]]; then
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
