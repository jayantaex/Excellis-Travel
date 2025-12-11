import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../core/network/api_response.dart';
import '../data/models/markup_data_model.dart';
import '../data/models/sates_data_model.dart';
import '../data/repository/sales_repository.dart';
import '../presentation/screens/child_data_model.dart';

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
    on<LoadAgentsEvent>(_handleLoadAgents);
    on<LoadSubSalesExecutivesEvent>(_handleLoadSubSalesExecutives);
  }
  final SalesRepository salesRepository;

  Future<void> _handleSalesFetchEvent(
      SalesFetchEvent event, Emitter<SalesState> emit) async {
    final currentState = state;
    List<Commissions> oldCommissions = [];

    // Always show loading for page 1 (initial load or refresh)
    // For page > 1, show loading more indicator while preserving data
    if (event.page == 1) {
      emit(SalesLoading());
    } else if (currentState is SalesLoaded) {
      oldCommissions = currentState.sales.commissions ?? [];
      emit(SalesLoaded(sales: currentState.sales, isLoadingMore: true));
    } else {
      emit(SalesLoading());
    }

    ApiResponse<SalesDataModel> response;

    if (event.agentIds.isEmpty) {
      // No agents/subSalesExecutives selected - fetch regular sales
      response = await salesRepository.fetchSales(
        page: event.page,
        limit: event.limit,
        startDate: event.startDate,
        endDate: event.endDate,
        keyword: event.keyword,
      );
    } else {
      // Determine userType: if agents are selected, use "agent", otherwise "partner"
      // If userType is already provided in event, use it; otherwise determine based on context
      final String userType = event.userType ?? 'agent';

      // Call API for each agentId and aggregate results
      List<Commissions> allCommissions = [];
      int totalItems = 0;
      double totalMarkup = 0.0;
      double totalSales = 0.0;
      String? errorMessage;

      // Fetch sales for each agent/subSalesExecutive sequentially
      for (final agentId in event.agentIds) {
        final agentResponse = await salesRepository.fetchSales(
          page: event.page,
          limit: event.limit,
          startDate: event.startDate,
          endDate: event.endDate,
          keyword: event.keyword,
          agentId: agentId,
          userType: userType,
        );

        if (agentResponse.data != null) {
          final salesData = agentResponse.data!;
          if (salesData.commissions != null) {
            allCommissions.addAll(salesData.commissions!);
          }
          // Aggregate totals
          totalItems += salesData.pagination?.totalItems ?? 0;
          totalMarkup += salesData.totalMarkup ?? 0.0;
          totalSales += salesData.totalSales ?? 0.0;
        } else {
          errorMessage = agentResponse.errorMessage ?? 'Failed to fetch sales';
        }
      }

      // Create aggregated response
      if (allCommissions.isNotEmpty || errorMessage == null) {
        final totalItemsCount =
            totalItems > 0 ? totalItems : allCommissions.length;
        final totalPagesCount = (totalItemsCount / event.limit).ceil();

        final aggregatedSalesData = SalesDataModel(
          success: true,
          commissions: allCommissions,
          pagination: allCommissions.isNotEmpty
              ? Pagination(
                  totalItems: totalItemsCount,
                  currentPage: event.page,
                  totalPages: totalPagesCount,
                  itemsPerPage: event.limit,
                  hasNextPage: event.page < totalPagesCount,
                  hasPreviousPage: event.page > 1,
                )
              : null,
        );

        aggregatedSalesData.totalMarkup = totalMarkup;
        aggregatedSalesData.totalSales = totalSales;

        response = ApiResponse(
          statusCode: 200,
          data: aggregatedSalesData,
        );
      } else {
        response = ApiResponse(
          statusCode: 400,
          errorMessage: errorMessage,
        );
      }
    }

    log('response: ${response.data?.commissions?.length}');

    if (response.data != null) {
      // Always clear old commissions when fetching page 1
      // This ensures fresh data when filters are cleared or changed
      if (event.page == 1) {
        oldCommissions.clear();
      }

      final newSales = response.data!;
      if (currentState is SalesLoaded) {
        newSales.commissions = [...oldCommissions, ...?newSales.commissions];
      }
      emit(SalesLoaded(sales: newSales));
    } else {
      emit(SalesError(response.errorMessage ?? 'Unknown error'));
      if (currentState is SalesLoaded) {
        emit(SalesLoaded(sales: currentState.sales));
      } else {
        emit(SalesError(response.errorMessage ?? 'Unknown error'));
      }
    }
  }

  Future<void> _handleGetMarkup(
      GetMarkupEvent event, Emitter<SalesState> emit) async {
    emit(MarkupLoading());

    final ApiResponse<MarkupDataModel> response =
        await salesRepository.fetchMarkUp(
      page: 1,
      limit: 100,
    );

    if (response.data != null) {
      emit(MarkupLoaded(markUpData: response.data ?? MarkupDataModel()));
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

  Future<void> _handleLoadAgents(
      LoadAgentsEvent event, Emitter<SalesState> emit) async {
    final currentState = state;
    SalesDataModel? salesData;

    // Preserve sales data from various states
    if (currentState is SalesLoaded) {
      salesData = currentState.sales;
    } else if (currentState is LoadingSubSalesExecutives) {
      salesData = currentState.sales;
    } else if (currentState is SubSalesExecutivesLoaded) {
      salesData = currentState.sales;
    } else if (currentState is SubSalesExecutivesError) {
      salesData = currentState.sales;
    } else if (currentState is LoadingSalesAgents) {
      salesData = currentState.sales;
    } else if (currentState is SalesAgentsLoaded) {
      salesData = currentState.sales;
    } else if (currentState is SalesAgentsError) {
      salesData = currentState.sales;
    }

    // If no agentIds provided, don't change state - just return
    if (event.agentIds.isEmpty) {
      // If we have sales data, preserve it by emitting the current state with sales data
      if (salesData != null && currentState is! SalesLoaded) {
        emit(SalesLoaded(sales: salesData, isLoadingMore: false));
      }
      return;
    }

    emit(LoadingSalesAgents(sales: salesData));

    final List<ChildDataModel> agentsResponse = [];
    String? errorMessage;

    // Fetch all agents sequentially, waiting for each to complete
    for (final agentId in event.agentIds) {
      final ApiResponse<List<ChildDataModel>> response =
          await salesRepository.fetchAgents(agentId: agentId);
      if (response.data != null) {
        agentsResponse.addAll(response.data ?? []);
      } else {
        // Collect error message but continue with other agents
        errorMessage = response.errorMessage ?? 'Failed to load agents';
      }
    }

    // Emit success if we got any agents, otherwise emit error
    if (agentsResponse.isNotEmpty) {
      log('Agents loaded: ${agentsResponse.length}');
      emit(SalesAgentsLoaded(agents: agentsResponse, sales: salesData));
    } else if (errorMessage != null) {
      emit(SalesAgentsError(salesData, message: errorMessage));
    } else {
      // No agents and no error (empty list) - but preserve sales data
      emit(SalesAgentsLoaded(agents: agentsResponse, sales: salesData));
    }
  }

  Future<void> _handleLoadSubSalesExecutives(
      LoadSubSalesExecutivesEvent event, Emitter<SalesState> emit) async {
    final currentState = state;
    SalesDataModel? salesData;

    // Preserve SalesLoaded state if it exists
    if (currentState is SalesLoaded) {
      salesData = currentState.sales;
    }

    emit(LoadingSubSalesExecutives(sales: salesData));
    final ApiResponse<List<ChildDataModel>> response =
        await salesRepository.fetchSubSalesExecutives();
    if (response.data != null) {
      emit(SubSalesExecutivesLoaded(
        subSalesExecutives: response.data ?? [],
        sales: salesData,
      ));
    } else {
      emit(SubSalesExecutivesError(
        message: response.errorMessage ?? 'Failed to load sub sales executives',
        sales: salesData,
      ));
    }
  }
}
