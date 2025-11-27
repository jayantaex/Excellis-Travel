import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_styles.dart';
import '../../../../core/errors/error_screen.dart';
import '../../../../core/utils/app_helpers.dart';
import '../../../../core/utils/storage_service.dart';
import '../../../../core/widgets/app_custom_appbar.dart';
import '../../../../core/widgets/app_sheet.dart';
import '../../../../core/widgets/no_login_widget.dart';
import '../../../../core/widgets/trans_white_bg_widget.dart';
import '../../bloc/sales_bloc.dart';
import '../widgets/filter_sheet.dart';
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
              startDate: _startDateController.text,
              endDate: _endDateController.text,
              keyword: _bookingIdController.text),
        );
  }

  @override
  Widget build(BuildContext context) => TransWhiteBgWidget(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppCustomAppbar(
                isBackButtonRequired: false,
                centerTitle: 'My Sales',
                trailing: SizedBox(
                  width: 45,
                  child: IconButton(
                      onPressed: () async {
                        await showAppSheet(
                            context: context,
                            title: 'Filter Options',
                            child: FilterSheet(
                              bookingIdController: _bookingIdController,
                              startDateController: _startDateController,
                              endDateController: _endDateController,
                              onStartDatePicked: (date) {
                                _startDateController.text =
                                    AppHelpers.formatDate(date,
                                        pattern: 'yyyy-MM-dd');
                              },
                              onEndDatePicked: (date) {
                                _endDateController.text = AppHelpers.formatDate(
                                    date,
                                    pattern: 'yyyy-MM-dd');
                              },
                            ),
                            onSubmitPressed: () async {
                              Navigator.pop(context);
                              page = 1;
                              await callApi(page: page, limit: limit);
                            },
                            submitButtonRequired: true,
                            submitButtonTitle: 'Apply');
                      },
                      icon:
                          const Icon(Icons.filter_alt, color: AppColors.white)),
                ),
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
                        if (state is SalesLoading || state is SalesInitial) {
                          return const Expanded(
                            child: Center(
                                child: CircularProgressIndicator.adaptive()),
                          );
                        }
                        if (state is SalesLoaded) {
                          totalItems = state.sales.pagination?.totalItems ?? 0;
                          return Expanded(
                            child: totalItems == 0
                                ? (_bookingIdController.text.isNotEmpty ||
                                        _startDateController.text.isNotEmpty ||
                                        _endDateController.text.isNotEmpty)
                                    ? NoSales(
                                        onFilter: () async {
                                          _bookingIdController.clear();
                                          _startDateController.clear();
                                          _endDateController.clear();
                                          page = 1;
                                          await callApi(
                                              page: page, limit: limit);
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
                                            0.35,
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
                                                      .withOpacity(0.3),
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
                                                          'Total Earnings',
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: AppColors
                                                                .white
                                                                .withOpacity(
                                                                    0.9),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            height: 8),
                                                        Text(
                                                          '₹${state.sales.totalMarkup ?? '0'}',
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
                                                            .withOpacity(0.2),
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
                                                              .withOpacity(
                                                                  0.15),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                        ),
                                                        child: Column(
                                                          children: [
                                                            Text(
                                                              '${state.sales.pagination?.totalItems ?? 0}',
                                                              style:
                                                                  const TextStyle(
                                                                fontSize: 20,
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
                                                              'Total Bookings',
                                                              style: TextStyle(
                                                                fontSize: 11,
                                                                color: AppColors
                                                                    .white
                                                                    .withOpacity(
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
                                                              .withOpacity(
                                                                  0.15),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                        ),
                                                        child: Column(
                                                          children: [
                                                            Text(
                                                              '₹${((double.tryParse('${state.sales.totalMarkup}') ?? 0) / (state.sales.pagination?.totalItems ?? 1)).toStringAsFixed(0)}',
                                                              style:
                                                                  const TextStyle(
                                                                fontSize: 20,
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
                                                              'Avg. Earning',
                                                              style: TextStyle(
                                                                fontSize: 11,
                                                                color: AppColors
                                                                    .white
                                                                    .withOpacity(
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
                                                  (state.sales.commissions
                                                          ?.length ??
                                                      0)) {
                                                return SaleTile(
                                                    commission: state.sales
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
                                            childCount: (state.sales.commissions
                                                        ?.length ??
                                                    0) +
                                                (state.isLoadingMore ? 1 : 0),
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
}
