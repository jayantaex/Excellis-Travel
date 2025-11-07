import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../constants/app_constants.dart';

class RazorpayService {
  final Razorpay _razorpay = Razorpay();

  final Map<String, dynamic> _options = {
    'key': AppConstants.razorpayKey,
    'name': AppConstants.razorpayUserName,
    'theme': {'color': '#f25a12'}
  };

  Future<void> initatePayment({
    required int amount,
    required String description,
    required String orderId,
    required String mobile,
    required String email,
    required Function(PaymentSuccessResponse) onSuccess,
    required Function(PaymentFailureResponse) onError,
  }) async {
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, onSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, onError);
    _options['amount'] = amount;
    _options['description'] = description;
    _options['order_id'] = orderId;
    _options['prefill'] = {
      'contact': mobile,
      'email': email,
    };

    _razorpay.open(_options);
  }
}
