import 'dart:developer';

import 'package:excellistravel/core/utils/app_helpers.dart';
import 'package:excellistravel/core/utils/storage_service.dart';
import 'package:excellistravel/core/widgets/app_sheet.dart';
import 'package:excellistravel/core/widgets/no_login_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_styles.dart';
import '../../../../core/errors/error_screen.dart';
import '../../../../core/widgets/app_custom_appbar.dart';
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
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.transparent,
        body: TransWhiteBgWidget(
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppCustomAppbar(
                  isBackButtonRequired: false,
                  centerTitle: 'My Sales',
                  trailing: IconButton(
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
                            onSubmitPressed: () {
                              Navigator.pop(context);
                              page = 1; // Reset page when applying filters
                              callApi(page: page, limit: limit);
                            },
                            submitButtonRequired: true,
                            submitButtonTitle: 'Apply');
                      },
                      icon:
                          const Icon(Icons.filter_alt, color: AppColors.white)),
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
                            log('${state.sales.pagination?.toJson()}');
                            totalItems =
                                state.sales.pagination?.totalItems ?? 0;
                            return Expanded(
                              child: totalItems == 0
                                  ? const NoSales()
                                  : Column(
                                      children: [
                                        const SizedBox(height: 35),
                                        Text('₹${state.sales.totalMarkup}',
                                            style: const TextStyle(
                                                fontSize: 45,
                                                fontWeight: FontWeight.bold,
                                                color: AppColors.white)),
                                        const SizedBox(height: 2),
                                        const Text(
                                          'My Earning',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.white,
                                          ),
                                        ),
                                        const SizedBox(height: 18),
                                        Expanded(
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 18, horizontal: 16),
                                            width: AppHelpers.getScreenWidth(
                                                context),
                                            decoration: BoxDecoration(
                                              color: AppColors.white,
                                              borderRadius:
                                                  BorderRadius.circular(32),
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 25,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        'Bookings(${state.sales.pagination?.totalItems ?? 0})',
                                                        style: const TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: AppColors
                                                                .black),
                                                      ),
                                                      _startDateController.text
                                                                  .isNotEmpty ||
                                                              _endDateController
                                                                  .text
                                                                  .isNotEmpty ||
                                                              _bookingIdController
                                                                  .text
                                                                  .isNotEmpty
                                                          ? SizedBox(
                                                              child: InkWell(
                                                              onTap: () {
                                                                _startDateController
                                                                    .clear();
                                                                _endDateController
                                                                    .clear();
                                                                _bookingIdController
                                                                    .clear();
                                                                page =
                                                                    1; // Reset page when clearing filters
                                                                callApi(
                                                                    page: page,
                                                                    limit:
                                                                        limit);
                                                              },
                                                              child: const Text(
                                                                  'Clear',
                                                                  style: TextStyle(
                                                                      color: AppColors
                                                                          .primary)),
                                                            ))
                                                          : const SizedBox()
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  child: ListView.builder(
                                                    controller:
                                                        _scrollController,
                                                    itemCount: (state
                                                                .sales
                                                                .commissions
                                                                ?.length ??
                                                            0) +
                                                        (state.isLoadingMore
                                                            ? 1
                                                            : 0),
                                                    itemBuilder:
                                                        (BuildContext context,
                                                            int index) {
                                                      if (index <
                                                          (state
                                                                  .sales
                                                                  .commissions
                                                                  ?.length ??
                                                              0)) {
                                                        return SaleTile(
                                                            commission: state
                                                                    .sales
                                                                    .commissions![
                                                                index]);
                                                      } else {
                                                        return const Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  8.0),
                                                          child: Center(
                                                              child: CircularProgressIndicator
                                                                  .adaptive()),
                                                        );
                                                      }
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                            );
                          }
                          return const Expanded(
                              child: Center(child: NoSales()));
                        },
                      )
              ],
            ),
          ),
        ),
      );
}
