import 'package:excellistravel/core/network/api_client.dart';
import 'package:excellistravel/core/network/api_response.dart';
import 'package:excellistravel/core/network/api_urls.dart';
import 'package:excellistravel/features/payment/data/mock_resp.dart';

import '../../models/payment_order_model.dart';

class PaymentRemoteSrc {
  PaymentRemoteSrc({required this.apiClient});
  final ApiClient apiClient;

  Future<ApiResponse<PaymentOrderModel>> createOrder() async =>
      // apiClient.postRequest(
      //     endPoint: EndPoints.createPayment,
      //     fromJson: PaymentOrderModel.fromJson);
      mockApiResponse(isError: false, data: PaymentOrderModel());

  Future<ApiResponse<void>> verifyPayment() async => apiClient.postRequest(
      endPoint: EndPoints.verifyPayment, fromJson: (data) => null);
}
