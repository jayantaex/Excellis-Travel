import 'package:alice_lightweight/alice.dart';
import 'package:alice_lightweight/core/alice_dio_interceptor.dart';
import 'package:flutter/material.dart';

/// Global Alice instance for network inspection
/// Access this from anywhere in your app to view network logs
class AliceHelper {
  static final Alice _alice = Alice();

  static Alice get instance => _alice;

  /// Get the Dio interceptor to add to your Dio instance
  static AliceDioInterceptor get dioInterceptor => _alice.getDioInterceptor();

  /// Show Alice inspector manually
  static void showInspector(BuildContext context) {
    _alice.showInspector();
  }

  /// Get the navigator key to add to your MaterialApp
  static GlobalKey<NavigatorState> get navigatorKey => _alice.getNavigatorKey();
}
