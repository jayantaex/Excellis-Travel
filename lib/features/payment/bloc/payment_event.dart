part of 'payment_bloc.dart';

sealed class PaymentEvent extends Equatable {
  const PaymentEvent();

  @override
  List<Object> get props => [];
}

final class CreateOrder extends PaymentEvent {
  const CreateOrder();
}

final class VerifyPaymentOrder extends PaymentEvent {
  const VerifyPaymentOrder();
}
