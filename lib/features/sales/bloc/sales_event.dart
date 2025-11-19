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
    required this.startDate,
    required this.endDate,
  });
  final int page;
  final int limit;
  final String startDate;
  final String endDate;
}
