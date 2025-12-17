part of 'payment_bloc.dart';

sealed class PaymentState extends Equatable {
  const PaymentState();

  @override
  List<Object> get props => [];
}

final class PaymentInitial extends PaymentState {}

final class PaymentLoading extends PaymentState {}

final class PaymentSuccess extends PaymentState {
  const PaymentSuccess(this.order);
  final PaymentOrderModel order;
}

final class PaymentFailure extends PaymentState {
  const PaymentFailure(this.errorMessage);
  final String errorMessage;
}

final class OrderCreated extends PaymentState {
  const OrderCreated();
}

final class PaymentVerified extends PaymentState {
  const PaymentVerified();
}
