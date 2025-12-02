import 'dart:async';

import 'package:flutter/material.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import '../constants/app_styles.dart';

class NetworkChecker {
  late final StreamSubscription<InternetStatus> _subscription;
  Future<bool> hasInternetConnection() async =>
      await InternetConnection().hasInternetAccess;

  void subscribe({
    required GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey,
  }) {
    bool isFirstTime = true;
    _subscription = InternetConnection().onStatusChange.listen((status) {
      if (status == InternetStatus.connected) {
        scaffoldMessengerKey.currentState?.hideCurrentSnackBar();
        Future.delayed(const Duration(seconds: 1), () {
          if (isFirstTime) {
            isFirstTime = false;
            return;
          }
          scaffoldMessengerKey.currentState?.showSnackBar(
            const SnackBar(
              showCloseIcon: true,
              closeIconColor: AppColors.white,
              content: Text('Back to online'),
              backgroundColor: AppColors.success,
            ),
          );
        });
      } else {
        scaffoldMessengerKey.currentState?.showSnackBar(
          const SnackBar(
            showCloseIcon: true,
            closeIconColor: AppColors.white,
            content: Text('No internet connection'),
            backgroundColor: AppColors.error,
            duration: Duration(days: 1),
          ),
        );
      }
    });
  }

  void pause() {
    _subscription.pause();
  }

  void resume() {
    _subscription.resume();
  }

  void unsubscribe() {
    _subscription.cancel();
  }
}
