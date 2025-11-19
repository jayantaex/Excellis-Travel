part of 'sales_bloc.dart';

sealed class SalesEvent extends Equatable {
  const SalesEvent();

  @override
  List<Object> get props => [];
}

class SalesFetchEvent extends SalesEvent {
  const SalesFetchEvent({
    required this.page,
    required this.limit,
  });
  final int page;
  final int limit;
}
