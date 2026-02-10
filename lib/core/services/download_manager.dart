import 'dart:developer';

import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

import '../../utils/storage_service.dart';

class DownloadManager {
  static Future<void> init() async {
    await FlutterDownloader.initialize(debug: true);
  }

  static Future<String?> downloadFile(String url, String fileName) async {
    try {
      final String? accessToken = await StorageService.getAccessToken();

      // Get the proper download directory path
      String savedDir;
      if (Platform.isAndroid) {
        // For Android, use the Downloads directory
        savedDir = '/storage/emulated/0/Download';
      } else {
        // For iOS, use the app's documents directory
        final directory = await getApplicationDocumentsDirectory();
        savedDir = directory.path;
      }

      final taskId = await FlutterDownloader.enqueue(
        url: url,
        savedDir: savedDir,
        fileName: fileName,
        saveInPublicStorage: true,
        headers: {
          'Authorization': 'Bearer $accessToken',
        },
      );
      log('$savedDir/$fileName', name: 'Download Path');

      return taskId;
    } catch (e) {
      throw Exception('Failed to download file: $e');
    }
  }

  static Future<void> openFile(String taskId) async {
    try {
      await FlutterDownloader.open(taskId: taskId);
    } catch (e) {
      throw Exception('Failed to open file: $e');
    }
  }
}
