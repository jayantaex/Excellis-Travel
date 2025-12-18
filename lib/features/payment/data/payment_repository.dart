import '../../../core/network/api_response.dart';
import '../models/payment_order_model.dart';
import 'src/payment_remote_src.dart';

class PaymentRepository {
  PaymentRepository({required this.remoteSrc});
  final PaymentRemoteSrc remoteSrc;

  Future<ApiResponse<PaymentOrderModel>> createOrder() async =>
      await remoteSrc.createOrder();
}
