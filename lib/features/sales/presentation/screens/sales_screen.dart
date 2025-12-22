import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_styles.dart';
import '../../../../core/errors/error_screen.dart';
import '../../../../utils/app_helpers.dart';
import '../../../../utils/storage_service.dart';
import '../../../../core/widgets/app_custom_appbar.dart';
import '../../../../core/widgets/app_sheet.dart';
import '../../../../core/widgets/no_login_widget.dart';
import '../../../../core/widgets/trans_white_bg_widget.dart';
import '../../../profile_management/bloc/profile_bloc.dart';
import '../../bloc/sales_bloc.dart';
import '../../data/models/sates_data_model.dart';
import '../widgets/sales_filter_sheet.dart';
import '../widgets/no_sales.dart';
import '../widgets/sale_tile.dart';

class SalesScreen extends StatefulWidget {
  const SalesScreen({super.key});

  @override
  State<SalesScreen> createState() => _SalesScreenState();
}

class _SalesScreenState extends State<SalesScreen> {
  String? token;
  final ScrollController _scrollController = ScrollController();
  int limit = 10;
  int page = 1;
  int totalItems = 0;

  final TextEditingController _bookingIdController = TextEditingController();
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();
  final List<int> _selectedUserIds = [];
  String? _selectedUserType;
  DateTime? startingDate;
  DateTime? endingDate;

  @override
  void initState() {
    Future.microtask(() async {
      token = await StorageService.getAccessToken();
      setState(() {});
      if (context.mounted && token != null && token!.isNotEmpty) {
        await callApi(page: page, limit: limit);
      }
      _scrollController.addListener(_onScroll);
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    _bookingIdController.dispose();
    _startDateController.dispose();
    _endDateController.dispose();
    super.dispose();
  }

  Future<void> _onScroll() async {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      page++;
      await callApi(page: page, limit: limit);
    }
  }

  Future<void> callApi({required int page, required int limit}) async {
    context.read<SalesBloc>().add(
          SalesFetchEvent(
            page: page,
            limit: limit,
            startDate: startingDate != null
                ? AppHelpers.formatDate(startingDate!, pattern: 'yyyy-MM-dd')
                : '',
            endDate: endingDate != null
                ? AppHelpers.formatDate(endingDate!, pattern: 'yyyy-MM-dd')
                : '',
            keyword: _bookingIdController.text,
            agentIds: _selectedUserIds,
            userType: _selectedUserType,
          ),
        );
  }

  @override
  Widget build(BuildContext context) => TransWhiteBgWidget(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<ProfileBloc, ProfileState>(
                builder: (context, state) {
                  if (state is ProfileLoaded) {
                    return AppCustomAppbar(
                      isBackButtonRequired: false,
                      centerTitle: 'My Sales',
                      //only show filter button if there is no filter applied
                      trailing: _startDateController.text.isNotEmpty ||
                              _endDateController.text.isNotEmpty ||
                              _bookingIdController.text.isNotEmpty ||
                              _selectedUserIds.isNotEmpty ||
                              _selectedUserType != null
                          ? const SizedBox()
                          : SizedBox(
                              width: 45,
                              child: IconButton(
                                  onPressed: () async {
                                    final salesBloc = context.read<SalesBloc>();
                                    await showAppSheet(
                                      context: context,
                                      title: 'Filter Options',
                                      child: BlocProvider.value(
                                        value: salesBloc,
                                        child: SalesFilterSheet(
                                          role:
                                              state.profileData.role ?? 'agent',
                                          bookingIdController:
                                              _bookingIdController,
                                          startDateController:
                                              _startDateController,
                                          endDateController: _endDateController,
                                          onStartDatePicked: (date) {
                                            _startDateController.text =
                                                AppHelpers.formatDate(date,
                                                    pattern: 'dd-MM-yyyy');
                                            startingDate = date;
                                          },
                                          onEndDatePicked: (date) {
                                            _endDateController.text =
                                                AppHelpers.formatDate(date,
                                                    pattern: 'dd-MM-yyyy');
                                            endingDate = date;
                                          },
                                          onSubmitPressed:
                                              (agentIds, userType) async {
                                            page = 1;
                                            _selectedUserIds.clear();
                                            _selectedUserIds
                                                .addAll(agentIds ?? []);
                                            _selectedUserType =
                                                userType ?? 'agent';
                                            await callApi(
                                                page: page, limit: limit);
                                          },
                                        ),
                                      ),
                                      onClosePressed: () {
                                        _resetFilters();
                                      },
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.filter_alt,
                                    color: AppColors.white,
                                  )),
                            ),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
              token == null || token!.isEmpty
                  ? const Expanded(child: Center(child: NotLoginWidget()))
                  : BlocConsumer<SalesBloc, SalesState>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        if (state is SalesError) {
                          return Expanded(
                              child: ErrorScreen(
                            errorMessage: 'Oops!',
                            errorDesc: state.message,
                          ));
                        }
                        // Show loading for initial load, page 1 refresh, or initial state
                        if (state is SalesLoading || state is SalesInitial) {
                          return const Expanded(
                            child: Center(
                                child: CircularProgressIndicator.adaptive()),
                          );
                        }
                        // Handle states that preserve sales data
                        final SalesDataModel? salesData = state is SalesLoaded
                            ? state.sales
                            : state is LoadingSubSalesExecutives
                                ? state.sales
                                : state is SubSalesExecutivesLoaded
                                    ? state.sales
                                    : state is SubSalesExecutivesError
                                        ? state.sales
                                        : state is SalesAgentsLoaded
                                            ? state.sales
                                            : state is SalesAgentsError
                                                ? state.sales
                                                : state is LoadingSalesAgents
                                                    ? state.sales
                                                    : null;

                        if (salesData != null) {
                          totalItems = salesData.pagination?.totalItems ?? 0;
                          return Expanded(
                            child: totalItems == 0
                                ? (_bookingIdController.text.isNotEmpty ||
                                        _startDateController.text.isNotEmpty ||
                                        _endDateController.text.isNotEmpty ||
                                        _selectedUserIds.isNotEmpty)
                                    ? NoSales(
                                        onFilter: () async {
                                          _bookingIdController.clear();
                                          _startDateController.clear();
                                          _endDateController.clear();
                                          _selectedUserIds.clear();
                                          _selectedUserType = null;
                                          startingDate = null;
                                          endingDate = null;
                                          limit = 10;
                                          page = 1;
                                          await callApi(
                                              limit: limit, page: page);
                                        },
                                        isForFilter: true,
                                      )
                                    : NoSales(
                                        onFilter: () {},
                                        isForFilter: false,
                                      )
                                : CustomScrollView(
                                    controller: _scrollController,
                                    slivers: [
                                      // Collapsible Earnings Card
                                      SliverAppBar(
                                        expandedHeight: AppHelpers.percenHeight(
                                                context: context) *
                                            0.34,
                                        pinned: true,
                                        backgroundColor: Colors.transparent,
                                        elevation: 0.5,
                                        automaticallyImplyLeading: false,
                                        flexibleSpace: FlexibleSpaceBar(
                                          background: Container(
                                            margin: const EdgeInsets.only(
                                              left: 16,
                                              right: 16,
                                              top: 24,
                                              bottom: 20,
                                            ),
                                            padding: const EdgeInsets.all(24),
                                            decoration: BoxDecoration(
                                              gradient: const LinearGradient(
                                                colors: [
                                                  AppColors.primary,
                                                  AppColors.secondary
                                                ],
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(24),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: AppColors.primary
                                                      .withValues(alpha: 0.3),
                                                  blurRadius: 20,
                                                  offset: const Offset(0, 8),
                                                ),
                                              ],
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'Total Markup',
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: AppColors
                                                                .white
                                                                .withValues(
                                                                    alpha: 0.9),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            height: 8),
                                                        Text(
                                                          '₹${salesData.totalMarkup ?? '0'}',
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 36,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                AppColors.white,
                                                            letterSpacing: -0.5,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Container(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              16),
                                                      decoration: BoxDecoration(
                                                        color: AppColors.white
                                                            .withValues(
                                                                alpha: 0.2),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16),
                                                      ),
                                                      child: const Icon(
                                                        Icons
                                                            .account_balance_wallet_rounded,
                                                        color: AppColors.white,
                                                        size: 32,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(height: 20),
                                                // Stats Row
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(12),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: AppColors.white
                                                              .withValues(
                                                                  alpha: 0.15),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                        ),
                                                        child: Column(
                                                          children: [
                                                            Text(
                                                              '${salesData.pagination?.totalItems ?? 0}',
                                                              style:
                                                                  const TextStyle(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: AppColors
                                                                    .white,
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                                height: 4),
                                                            Text(
                                                              'Total Ticket Booked',
                                                              style: TextStyle(
                                                                fontSize: 12,
                                                                color: AppColors
                                                                    .white
                                                                    .withValues(
                                                                        alpha:
                                                                            0.8),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(width: 12),
                                                    Expanded(
                                                      child: Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(12),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: AppColors.white
                                                              .withValues(
                                                                  alpha: 0.15),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                        ),
                                                        child: Column(
                                                          children: [
                                                            Text(
                                                              '₹${salesData.totalSales ?? 0}',
                                                              style:
                                                                  const TextStyle(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: AppColors
                                                                    .white,
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                                height: 4),
                                                            Text(
                                                              'Total Amount',
                                                              style: TextStyle(
                                                                fontSize: 12,
                                                                color: AppColors
                                                                    .white
                                                                    .withValues(
                                                                        alpha:
                                                                            0.8),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      // Transactions List Header

                                      //total booking with count and reset button,
                                      SliverToBoxAdapter(
                                        child: SizedBox(
                                          height: 40,
                                          width: AppHelpers.getScreenWidth(
                                              context),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 16),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Total Booking (${salesData.pagination?.totalItems ?? 0})',
                                                  style: const TextStyle(
                                                      fontSize: 12,
                                                      color: AppColors.white),
                                                ),
                                                _startDateController
                                                            .text.isNotEmpty ||
                                                        _endDateController
                                                            .text.isNotEmpty ||
                                                        _bookingIdController
                                                            .text.isNotEmpty ||
                                                        _selectedUserIds
                                                            .isNotEmpty ||
                                                        _selectedUserType !=
                                                            null
                                                    ? SizedBox(
                                                        height: 45,
                                                        width: 80,
                                                        child: TextButton(
                                                            onPressed: () {
                                                              _resetFilters();
                                                            },
                                                            child: Text(
                                                              'Clear',
                                                              style: TextStyle(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: AppHelpers
                                                                        .isDarkMode(
                                                                            context)
                                                                    ? AppColors
                                                                        .primary
                                                                    : AppColors
                                                                        .white,
                                                              ),
                                                            )),
                                                      )
                                                    : const SizedBox(),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),

                                      // Sales List
                                      SliverPadding(
                                        padding: const EdgeInsets.only(
                                          left: 16,
                                          right: 16,
                                          top: 16,
                                          bottom: 16,
                                        ),
                                        sliver: SliverList(
                                          delegate: SliverChildBuilderDelegate(
                                            (BuildContext context, int index) {
                                              if (index <
                                                  (salesData.commissions
                                                          ?.length ??
                                                      0)) {
                                                return SaleTile(
                                                    commission: salesData
                                                        .commissions![index]);
                                              } else {
                                                return const Padding(
                                                  padding: EdgeInsets.all(16.0),
                                                  child: Center(
                                                      child:
                                                          CircularProgressIndicator
                                                              .adaptive()),
                                                );
                                              }
                                            },
                                            childCount: (salesData
                                                        .commissions?.length ??
                                                    0) +
                                                ((state is SalesLoaded &&
                                                        state.isLoadingMore)
                                                    ? 1
                                                    : 0),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                          );
                        }
                        return const Expanded(
                          child: Center(
                            child: NoSales(),
                          ),
                        );
                      },
                    )
            ],
          ),
        ),
      );

  void _resetFilters() {
    setState(() {
      page = 1;
      _startDateController.clear();
      _endDateController.clear();
      _bookingIdController.clear();
      _selectedUserIds.clear();
      _selectedUserType = null;
      startingDate = null;
      endingDate = null;
      limit = 10;
    });
    callApi(limit: limit, page: page);
  }
}
