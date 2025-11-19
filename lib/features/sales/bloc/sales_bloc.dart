import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../core/network/api_response.dart';
import '../data/models/sates_data_model.dart';
import '../data/repository/sales_repository.dart';

part 'sales_event.dart';
part 'sales_state.dart';

class SalesBloc extends Bloc<SalesEvent, SalesState> {
  SalesBloc(this.salesRepository) : super(SalesInitial()) {
    on<SalesEvent>((event, emit) {});
    on<SalesFetchEvent>(_handleSalesFetchEvent);
  }
  final SalesRepository salesRepository;

  Future<void> _handleSalesFetchEvent(
      SalesFetchEvent event, Emitter<SalesState> emit) async {
    final currentState = state;
    List<Commissions> oldCommissions = [];

    if (currentState is SalesLoaded) {
      oldCommissions = currentState.sales.commissions ?? [];
      emit(SalesLoaded(sales: currentState.sales, isLoadingMore: true));
    } else {
      emit(SalesLoading());
    }

    final ApiResponse<SalesDataModel> response =
        await salesRepository.fetchSales(
      page: event.page,
      limit: event.limit,
    );

    if (response.data != null) {
      final newSales = response.data!;
      if (currentState is SalesLoaded) {
        newSales.commissions = [...oldCommissions, ...?newSales.commissions];
      }
      emit(SalesLoaded(sales: newSales));
    } else {
      log(response.errorMessage ?? 'Unknown error');
      if (currentState is SalesLoaded) {
        emit(SalesLoaded(sales: currentState.sales, isLoadingMore: false));
      } else {
        emit(SalesError(response.errorMessage ?? 'Unknown error'));
      }
    }
  }
}
