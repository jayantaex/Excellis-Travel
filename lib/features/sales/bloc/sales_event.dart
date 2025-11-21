part of 'sales_bloc.dart';

sealed class SalesEvent extends Equatable {
  const SalesEvent();

  @override
  List<Object> get props => [];
}

class SalesFetchEvent extends SalesEvent {
  const SalesFetchEvent(
      {required this.page,
      required this.limit,
      required this.startDate,
      required this.endDate,
      required this.keyword});
  final int page;
  final int limit;
  final String startDate;
  final String keyword;
  final String endDate;
}

class SalesAddMarkupEvent extends SalesEvent {
  const SalesAddMarkupEvent({required this.body});
  final Map<String, dynamic> body;
}

class GetMarkupEvent extends SalesEvent {
  const GetMarkupEvent();
}

class DeleteMarkupEvent extends SalesEvent {
  const DeleteMarkupEvent({required this.id});
  final int id;
}

class SalesUpdateMarkupEvent extends SalesEvent {
  const SalesUpdateMarkupEvent({required this.body, required this.id});
  final Map<String, dynamic> body;
  final int id;
}
