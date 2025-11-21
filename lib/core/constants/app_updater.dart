import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
// import 'package:r_upgrade/r_upgrade.dart';

import 'app_constants.dart';

class AppUpdater {
  AppUpdater() {
    _dio.options.baseUrl =
        'https://res.cloudinary.com/detjdvs7r/raw/upload/version_kajdzf.json';
  }
  final Dio _dio = Dio();
  Future<Map<String, dynamic>> getLatestVersion() async {
    try {
      final Response res = await _dio.get('');
      return res.data;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<bool> isUpdateAvailable() async {
    try {
      final Map<String, dynamic> latestVersion = await getLatestVersion();

      log('${latestVersion}');
      final double remoteVersion =
          double.parse(latestVersion['version'].toString());
      // final double currentVersion = double.parse(AppConstants.appVersion);
      // log("Remote  Version: $remoteVersion");
      // log("Current Version: $currentVersion");
      // return remoteVersion > currentVersion;
      return true;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> getLatestInfo() async {
    try {
      final Map<String, dynamic> latestVersion = await getLatestVersion();
      return latestVersion;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateApp() async {
    try {
      final Map<String, dynamic> latestInfo = await getLatestInfo();
      final String url = latestInfo['url'] ?? '';
      // final String version = latestInfo['version'] ?? '';
      // final appDocDir = await getTemporaryDirectory();
      // final String savePath = '${appDocDir.path}/Excellis_Travel_v$version.apk';
      // await _dio.download(
      //   url,
      //   savePath,
      //   onReceiveProgress: onReceiveProgress,
      // );
      // bool? isSuccess = await RUpgrade.upgradeFromUrl(url);
      // if ( false) {
      // }
      throw Exception('Error while download and updating');
    } catch (e) {
      rethrow;
    }
  }
}
