import 'package:in_app_update/in_app_update.dart';

class AppUpdateService {
  Future<AppUpdateInfo> checkForUpdate() async {
    try {
      return await InAppUpdate.checkForUpdate();
    } catch (e) {
      rethrow;
    }
  }

  Future<AppUpdateResult> immidiateUpdate() async {
    try {
      return await InAppUpdate.performImmediateUpdate();
    } catch (e) {
      rethrow;
    }
  }

  Future<AppUpdateResult> flexibleUpdate() async {
    try {
      return await InAppUpdate.startFlexibleUpdate();
    } catch (e) {
      rethrow;
    }
  }
}
