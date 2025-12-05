import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';

import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import '../network/api_urls.dart';
import '../utils/storage_service.dart';

class FileDownloaderService {
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
        directory = '/storage/emulated/0/Download/';
        dirDownloadExists = await Directory(directory).exists();
        if (!dirDownloadExists) {
          directory = (await getTemporaryDirectory()).path;
        }
      }
    }
    return directory;
  }

  static Future<bool> _saveFile({
    required Function(int count, int total) showDownloadProgress,
    required String baseFare,
    required String totalFare,
    required String markupPrice,
    required String bokkingRefId,
  }) async {
    try {
      if (Platform.isAndroid) {
        const Permission permission = Permission.manageExternalStorage;
        final PermissionStatus status = await permission.request();
        if (status.isPermanentlyDenied) {
          await openAppSettings();
        }
      }
      final String now = DateTime.now().millisecond.toString();
      final String savePath = '${await _getPath()}${bokkingRefId}_$now.pdf';
      final String? accessToken = await StorageService.getAccessToken();
      final String url =
          '${EndPoints.baseUrl}${EndPoints.downloadFile}/$bokkingRefId/download?format=pdf';
      final Dio dio = Dio();
      dio.options.baseUrl = url;
      await dio.download(
        queryParameters: {
          'baseFare': baseFare,
          'totalFare': totalFare,
          'markup': markupPrice,
        },
        options: Options(headers: {
          'Authorization': 'Bearer $accessToken',
        }),
        url,
        savePath,
        onReceiveProgress: (receivedBytes, totalBytes) {
          showDownloadProgress(receivedBytes, totalBytes);
        },
      );
      log('Successfully downloaded file to $savePath');
      return true;
    } catch (e) {
      log('$e');
      throw 'Failed to download file';
    }
  }

  static Future<bool> Function({
    required String bokkingRefId,
    required Function(int count, int total) showDownloadProgress,
    required String baseFare,
    required String totalFare,
    required String markupPrice,
  }) get saveFile => _saveFile;

  static Future<String> Function() get getPath => _getPath;
}
