part of 'sales_bloc.dart';

sealed class SalesState extends Equatable {
  const SalesState();

  @override
  List<Object> get props => [];
}

final class SalesInitial extends SalesState {}

final class SalesLoading extends SalesState {}

final class SalesLoaded extends SalesState {
  const SalesLoaded({
    required this.sales,
    this.isLoadingMore = false,
  });
  final SalesDataModel sales;
  final bool isLoadingMore;

  @override
  List<Object> get props => [sales, isLoadingMore];
}

final class SalesError extends SalesState {
  const SalesError(this.message);
  final String message;
  @override
  List<Object> get props => [message];
}

final class MarkupAdding extends SalesState {}

final class MarkupAddError extends SalesState {
  const MarkupAddError({required this.message});
  final String message;
}

final class MarkupAdded extends SalesState {}

final class MarkupLoading extends SalesState {}

final class MarkupLoadError extends SalesState {
  const MarkupLoadError({required this.message});
  final String message;
}

final class MarkupLoaded extends SalesState {}

final class MarkupUpdating extends SalesState {}

final class MarkupUpdateError extends SalesState {
  const MarkupUpdateError({required this.message});
  final String message;
}

final class MarkupUpdated extends SalesState {}
