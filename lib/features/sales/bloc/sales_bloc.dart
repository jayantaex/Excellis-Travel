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
    on<GetMarkupEvent>(_handleGetMarkup);
    on<DeleteMarkupEvent>(_handleDeleteMarkup);
    on<SalesUpdateMarkupEvent>(_handleUpdateMarkup);
    on<SalesAddMarkupEvent>(_handleAddMarkup);
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
      startDate: event.startDate,
      endDate: event.endDate,
      keyword: event.keyword,
    );

    if (response.data != null) {
      if (event.startDate.isNotEmpty ||
          event.endDate.isNotEmpty ||
          event.keyword.isNotEmpty) {
        oldCommissions.clear();
      }

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

  Future<void> _handleGetMarkup(
      GetMarkupEvent event, Emitter<SalesState> emit) async {
    emit(MarkupLoading());

    final response = await salesRepository.fetchMarkUp(
      page: 1,
      limit: 100,
    );

    if (response.data != null) {
      emit(MarkupLoaded());
    } else {
      emit(MarkupLoadError(
          message: response.errorMessage ?? 'Failed to load markup'));
    }
  }

  Future<void> _handleAddMarkup(
      SalesAddMarkupEvent event, Emitter<SalesState> emit) async {
    emit(MarkupAdding());

    final response = await salesRepository.addMarkUp(body: event.body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      emit(MarkupAdded());
    } else {
      emit(MarkupAddError(
          message: response.errorMessage ?? 'Failed to add markup'));
    }
  }

  Future<void> _handleUpdateMarkup(
      SalesUpdateMarkupEvent event, Emitter<SalesState> emit) async {
    emit(MarkupUpdating());

    final response = await salesRepository.editMarkUp(
      body: event.body,
      id: event.id,
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      emit(MarkupUpdated());
    } else {
      emit(MarkupUpdateError(
          message: response.errorMessage ?? 'Failed to update markup'));
    }
  }

  Future<void> _handleDeleteMarkup(
      DeleteMarkupEvent event, Emitter<SalesState> emit) async {
    emit(MarkupUpdating()); // Using updating state for delete as well

    final response = await salesRepository.deleteMarkUp(id: event.id);

    if (response.statusCode == 200 || response.statusCode == 204) {
      emit(MarkupUpdated()); // Using updated state for successful delete
    } else {
      emit(MarkupUpdateError(
          message: response.errorMessage ?? 'Failed to delete markup'));
    }
  }
}
