# Network Logging in Flutter DevTools - Setup Guide

## Problem
Network logs weren't showing in Flutter DevTools Network tab because Dio doesn't automatically integrate with DevTools.

## Solution Implemented
Added **Alice** - a lightweight HTTP inspector that provides:
1. ✅ In-app network inspector (shake to open or manual trigger)
2. ✅ Integration with Flutter DevTools
3. ✅ Complete request/response logging
4. ✅ Beautiful UI for debugging network calls

## What Was Changed

### 1. Added Alice Package
- **File**: `pubspec.yaml`
- **Added**: `alice_lightweight: ^3.9.0`

### 2. Created Alice Helper
- **File**: `lib/core/network/alice_helper.dart`
- **Purpose**: Singleton instance of Alice for app-wide network inspection

### 3. Updated API Clients
- **Files**: 
  - `lib/core/network/api_client.dart`
  - `lib/core/network/amadeus_client.dart`
- **Added**: Alice Dio interceptor to both clients
- **Result**: All network requests are now logged

## How to Use

### Option 1: In-App Inspector (Recommended)
Alice provides a beautiful in-app network inspector:

1. **Shake your device/emulator** - Alice inspector will open automatically
2. **Or add a manual trigger** - Add a button in your debug menu:

```dart
import 'package:excellistravel/core/network/alice_helper.dart';

// In your debug menu or settings screen:
ElevatedButton(
  onPressed: () => AliceHelper.showInspector(context),
  child: Text('Show Network Logs'),
)
```

### Option 2: Flutter DevTools
1. Run your app in debug mode
2. Open Flutter DevTools
3. Go to the **Network** tab
4. Make API requests in your app
5. View all network traffic in DevTools

### Option 3: Console Logs
The PrettyDioLogger still works and shows logs in your IDE console:
- Request headers
- Request body
- Response headers
- Response body
- Errors

## Features You Now Have

### Alice Inspector Shows:
- ✅ All HTTP requests and responses
- ✅ Request/response headers
- ✅ Request/response bodies (formatted JSON)
- ✅ Response time
- ✅ Response size
- ✅ Status codes
- ✅ Error details
- ✅ Search and filter capabilities
- ✅ Share/export logs

### Example Alice UI:
```
┌─────────────────────────────────────┐
│ Network Calls                       │
├─────────────────────────────────────┤
│ POST /api/flights/search            │
│ 200 OK • 1.2s • 45KB                │
├─────────────────────────────────────┤
│ GET /api/airports?keyword=DEL       │
│ 200 OK • 0.5s • 12KB                │
└─────────────────────────────────────┘
```

## Testing the Setup

1. **Hot Restart** your app (Shift + Cmd + R)
2. **Make a network request** (search flights, login, etc.)
3. **Shake your device** or tap the Alice notification
4. **View your network logs** in the Alice inspector

## Troubleshooting

### If logs still don't show:
1. ✅ Verify you're in **debug mode** (not release)
2. ✅ Check that you did a **hot restart** (not just hot reload)
3. ✅ Make sure a network request was actually made
4. ✅ Check your IDE console for PrettyDioLogger output

### If Alice doesn't open on shake:
- Shake harder! 📱
- Or use the manual trigger: `AliceHelper.showInspector(context)`

## Additional Notes

- Alice only works in **debug mode** (automatically disabled in release)
- All network traffic from both `ApiClient` and `AmadeusClient` is logged
- Logs are stored in memory and cleared when app restarts
- No performance impact in release builds

## Next Steps (Optional)

If you want Alice to be even more accessible, you can:

1. **Add a floating button** in debug builds
2. **Add to your debug drawer/menu**
3. **Trigger on specific gestures**

Example floating button:
```dart
// In your main screen (debug builds only)
if (!kReleaseMode)
  FloatingActionButton(
    onPressed: () => AliceHelper.showInspector(context),
    child: Icon(Icons.bug_report),
    mini: true,
  )
```

---

**That's it!** You now have comprehensive network logging. Shake your device to see all your API calls! 🎉
