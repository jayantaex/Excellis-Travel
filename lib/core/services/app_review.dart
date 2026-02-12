import 'dart:developer';
import 'dart:io';

import 'package:in_app_review/in_app_review.dart';

import '../constants/app_constants.dart';

class AppReviewService {
  AppReviewService._privateConstructor();
  static final AppReviewService instance =
      AppReviewService._privateConstructor();
  final InAppReview _inAppReview = InAppReview.instance;

  Future<void> requestReview() async {
    try {
      if (await _inAppReview.isAvailable()) {
        log('REVIEW AVAILABLE', name: 'IN APP REVIEW');
        await _inAppReview.requestReview();
      }
    } catch (e) {
      log('$e', name: 'IN APP REVIEW');
    }
  }

  Future<void> openStoreListing() {
    try {
      if (Platform.isAndroid) {
        return _inAppReview.openStoreListing();
      } else {
        return _inAppReview.openStoreListing(
            appStoreId: AppConstants.appStoreId);
      }
    } catch (e) {
      log('$e', name: 'IN APP REVIEW');
      return Future.error(e);
    }
  }
}
