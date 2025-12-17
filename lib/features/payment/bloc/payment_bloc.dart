import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:excellistravel/core/network/api_response.dart';

import '../data/payment_repository.dart';
import '../models/payment_order_model.dart';

part 'payment_event.dart';
part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  PaymentBloc({required this.repository}) : super(PaymentInitial()) {
    on<CreateOrder>(_handleCreateOrder);
    on<VerifyPaymentOrder>(_handleVerifyPaymentOrder);
  }
  final PaymentRepository repository;

  Future<void> _handleCreateOrder(
      CreateOrder event, Emitter<PaymentState> emit) async {
    emit(PaymentLoading());
    final ApiResponse<PaymentOrderModel> response =
        await repository.createOrder();
    if (response.data == null) {
      emit(PaymentFailure(response.errorMessage ?? ''));
    } else {
      emit(const OrderCreated());
    }
  }

  Future<void> _handleVerifyPaymentOrder(
      VerifyPaymentOrder event, Emitter<PaymentState> emit) async {
    emit(PaymentLoading());
    final ApiResponse<PaymentOrderModel> response =
        await repository.createOrder();
    if (response.data == null) {
      emit(PaymentFailure(response.errorMessage ?? ''));
    } else {
      emit(const PaymentVerified());
    }
  }
}
