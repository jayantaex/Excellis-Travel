import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../constants/app_constants.dart';

class RazorpayService {
  final Razorpay _razorpay = Razorpay();
  final Map<String, dynamic> _options = {
    'key': AppConstants.razorpayKey,
    'name': AppConstants.razorpayUserName,
    'theme': {'color': '#800080'}
  };

  Future<void> initatePayment({
    required double amount,
    required String description,
    required String mobile,
    required String email,
    required Function(PaymentSuccessResponse) onSuccess,
    required Function(PaymentFailureResponse) onError,
  }) async {
    _options['amount'] = (amount * 100).toInt();
    _options['description'] = description;
    _options['prefill'] = {
      'contact': mobile,
      'email': email,
    };

    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, onSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, onError);

    _razorpay.open(_options);
  }
}
