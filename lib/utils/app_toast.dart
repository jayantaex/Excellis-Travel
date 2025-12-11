import 'package:fluttertoast/fluttertoast.dart';

import '../core/constants/app_styles.dart';

void showToast({required String message}) {
  Fluttertoast.showToast(
    msg: message,
    backgroundColor: AppColors.black.withOpacity(0.6),
    textColor: AppColors.white,
    fontSize: 14.0,
  );
}
