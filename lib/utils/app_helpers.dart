import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import '../core/constants/app_constants.dart';

class AppHelpers {
  // Date formatting
  static String formatDate(DateTime date, {String pattern = 'dd/MM/yyyy'}) =>
      DateFormat(pattern).format(date);

  static String formatDateTime(DateTime date,
          {String pattern = 'dd/MM/yyyy HH:mm'}) =>
      DateFormat(pattern).format(date);

  static String formatTime(DateTime date, {String pattern = 'HH:mm'}) =>
      DateFormat(pattern).format(date);

  static String timeAgo(DateTime date) {
    final DateTime now = DateTime.now();
    final Duration difference = now.difference(date);

    if (difference.inDays > 365) {
      return '${(difference.inDays / 365).floor()} year${(difference.inDays / 365).floor() > 1 ? 's' : ''} ago';
    } else if (difference.inDays > 30) {
      return '${(difference.inDays / 30).floor()} month${(difference.inDays / 30).floor() > 1 ? 's' : ''} ago';
    } else if (difference.inDays > 0) {
      return '${difference.inDays} day${difference.inDays > 1 ? 's' : ''} ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} hour${difference.inHours > 1 ? 's' : ''} ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} minute${difference.inMinutes > 1 ? 's' : ''} ago';
    } else {
      return 'Just now';
    }
  }

  // Number formatting
  static String formatCurrency(double amount, {String symbol = '\$'}) {
    final formatter =
        NumberFormat.currency(locale: 'en_IN', symbol: '₹', decimalDigits: 2);
    return formatter.format(amount);
  }

  static String formatNumber(num number) =>
      NumberFormat('#,###').format(number);

  static String formatPercentage(double value) =>
      '${(value * 100).toStringAsFixed(1)}%';

  // String helpers
  static String capitalize(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1).toLowerCase();
  }

  static String capitalizeWords(String text) =>
      text.split(' ').map((String word) => capitalize(word)).join(' ');

  static String truncateText(String text, int maxLength) {
    if (text.length <= maxLength) return text;
    return '${text.substring(0, maxLength)}...';
  }

  static String removeHtmlTags(String htmlText) {
    final RegExp exp = RegExp(r'<[^>]*>');
    return htmlText.replaceAll(exp, '');
  }

  // File size formatting
  static String formatFileSize(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)} KB';
    if (bytes < 1024 * 1024 * 1024) {
      return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
    }
    return '${(bytes / (1024 * 1024 * 1024)).toStringAsFixed(1)} GB';
  }

  // Color helpers
  static String colorToHex(Color color) =>
      '#${color.value.toRadixString(16).substring(2).toUpperCase()}';

  static Color hexToColor(String hex) {
    hex = hex.replaceAll('#', '');
    if (hex.length == 6) hex = 'FF$hex';
    return Color(int.parse(hex, radix: 16));
  }

  // URL helpers
  static bool isValidUrl(String url) {
    const String urlRegex =
        r'^https?:\/\/[\w\-]+(\.[\w\-]+)+([\w\-\.,@?^=%&:/~\+#]*[\w\-\@?^=%&/~\+#])?$';
    return RegExp(urlRegex).hasMatch(url);
  }

  static String addHttpsIfMissing(String url) {
    if (!url.startsWith('http://') && !url.startsWith('https://')) {
      return 'https://$url';
    }
    return url;
  }

  // List helpers
  static List<T> removeDuplicates<T>(List<T> list) => list.toSet().toList();

  static List<List<T>> chunk<T>(List<T> list, int chunkSize) {
    final List<List<T>> chunks = <List<T>>[];
    for (int i = 0; i < list.length; i += chunkSize) {
      chunks.add(list.sublist(
          i, i + chunkSize > list.length ? list.length : i + chunkSize));
    }
    return chunks;
  }

  // Random generators
  static String generateRandomString(int length) {
    const String chars =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    return List.generate(
        length,
        (int index) =>
            chars[DateTime.now().millisecondsSinceEpoch % chars.length]).join();
  }

  // Debouncing
  static Timer? _debounceTimer;

  static void debounce(VoidCallback callback,
      {Duration delay = const Duration(milliseconds: 500)}) {
    _debounceTimer?.cancel();
    _debounceTimer = Timer(delay, callback);
  }

  // Device info
  static bool isTablet(BuildContext context) {
    final MediaQueryData data = MediaQuery.of(context);
    return data.size.shortestSide >= 600;
  }

  static bool isLandscape(BuildContext context) =>
      MediaQuery.of(context).orientation == Orientation.landscape;

  static double getScreenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static double getScreenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  // Navigation helpers
  static void hideKeyboard(BuildContext context) {
    FocusScope.of(context).unfocus();
  }

  static Future<void> showSnackBar(
    BuildContext context,
    String message, {
    Color? textColor,
    bool? showCloseButton,
    Color? backgroundColor,
    Duration duration = const Duration(seconds: 3),
    SnackBarAction? action,
  }) async {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: backgroundColor,
          duration: duration,
          action: action,
          showCloseIcon: showCloseButton ?? false,
        ),
      );
  }

  static Future<bool?> showConfirmDialog(
    BuildContext context, {
    required String title,
    required String content,
    String confirmText = 'Confirm',
    String cancelText = 'Cancel',
  }) =>
      showDialog<bool>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Text(title),
          content: Text(content),
          actions: <Widget>[
            Container(
              margin: const EdgeInsets.only(bottom: 8),
              child: TextButton(
                style: TextButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                ),
                onPressed: () => Navigator.of(context).pop(false),
                child: Text(cancelText),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 8),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    maximumSize: const Size.fromHeight(50)),
                onPressed: () => Navigator.of(context).pop(true),
                child: Text(confirmText),
              ),
            ),
          ],
        ),
      );

  // get value from JSON string by key
  static String? getStringFromMap(String? data, String key) {
    if (data == null) return null;
    try {
      final Map<String, dynamic> map = jsonDecode(data);
      return map[key]?.toString();
    } catch (e) {
      log('Error decoding JSON: $e');
      return null;
    }
  }

  // convert Map to JSON string
  static String mapToJson(Map<String, dynamic> map) => jsonEncode(map);

  // convert JSON string back to Map
  static Map<String, dynamic>? jsonToMap(String? data) {
    if (data == null) return null;
    try {
      return jsonDecode(data);
    } catch (e) {
      log('Error decoding JSON: $e');
      return null;
    }
  }

  // logout helper
  static Future<void> logout(
      BuildContext context, VoidCallback onLoggedOut) async {
    final bool? confirmed = await showConfirmDialog(
      context,
      title: 'Logout',
      content: 'Are you sure you want to logout?',
      confirmText: 'Logout',
    );
    if (confirmed == true) {
      onLoggedOut();
    }
  }

  //UI helper
  static double percenWidth({int? percent, required BuildContext context}) {
    if (percent == null) {
      return MediaQuery.sizeOf(context).width;
    }
    return (MediaQuery.sizeOf(context).width * percent) / 100;
  }

  static double percenHeight({int? percent, required BuildContext context}) {
    if (percent == null) {
      return MediaQuery.sizeOf(context).height;
    }
    return (MediaQuery.sizeOf(context).height * percent) / 100;
  }

  static Image assetImage(
          {required String assetName,
          double? width,
          double? height,
          String? ext}) =>
      Image.asset(
        '${AppConstants.assetImageUrl}$assetName.${ext ?? 'png'}',
        width: width,
        height: height,
      );

  static Image networkImage(
          {required String url, double? width, double? height, String? ext}) =>
      Image.network(
        url,
        width: width,
        height: height,
      );

  static SvgPicture svgAsset({
    required String assetName,
    bool? isIcon,
    double? width,
    double? height,
    Color? color,
  }) =>
      SvgPicture.asset(
        isIcon == true
            ? '${AppConstants.assetIconUrl}$assetName.svg'
            : '${AppConstants.assetImageUrl}$assetName.svg',
        width: width,
        height: height,
        colorFilter:
            color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null,
      );

  static bool validateEmail(String text) {
    final RegExp emailRegex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return emailRegex.hasMatch(text);
  }

  static bool validateMobileNumber(String text) {
    final RegExp mobileRegex = RegExp(r'^[0-9]{10}$');
    return mobileRegex.hasMatch(text);
  }

  static bool isDarkMode(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark;
}
