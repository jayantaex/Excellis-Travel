import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

import '../core/constants/app_constants.dart';
// import 'package:r_upgrade/r_upgrade.dart';

class AppUpdater {
  AppUpdater() {
    _dio.options.baseUrl =
        'https://api.jsonsilo.com/public/e11e3b59-c395-42e9-801f-14b2724ae799';
  }
  final Dio _dio = Dio();

  static Future<String> _getPath() async {
    String directory;
    if (Platform.isIOS) {
      directory = (await getDownloadsDirectory())?.path ??
          (await getTemporaryDirectory()).path;
    } else {
      directory = '/storage/emulated/0/Download/';
      bool dirDownloadExists = true;
      dirDownloadExists = await Directory(directory).exists();
      if (!dirDownloadExists) {
        directory = '/storage/emulated/0/Downloads/';
        dirDownloadExists = await Directory(directory).exists();
        if (!dirDownloadExists) {
          directory = (await getTemporaryDirectory()).path;
        }
      }
    }
    return directory;
  }

  Future<Map<String, dynamic>> getLatestVersion() async {
    try {
      final Response res = await _dio.get('');
      final Map<String, dynamic> resp = {
        'version': '${res.data['version']}',
        'url': '${res.data['url']}'
      };

      return resp;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<bool> isUpdateAvailable() async {
    try {
      final latestVersion = await getLatestVersion();
      return latestVersion['version'] != AppConstants.appVersion;
    } catch (e) {
      rethrow;
    }
  }

  Future<String> downloadApp(
      {required String url,
      required String latestVersion,
      required ProgressCallback? onReceiveProgress}) async {
    try {
      final String savePath = '${await _getPath()}ext_v_$latestVersion.apk';
      await _dio.download(
        url,
        savePath,
        onReceiveProgress: onReceiveProgress,
      );
      log('App is on path $savePath');
      return savePath;
    } catch (e) {
      rethrow;
    }
  }
}
