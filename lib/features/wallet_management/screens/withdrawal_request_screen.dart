import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/app_styles.dart';
import '../../../core/widgets/app_custom_appbar.dart';
import '../../../core/widgets/app_gradient_bg.dart';
import '../../../core/widgets/app_sheet.dart';
import '../../../core/widgets/trans_white_bg_widget.dart';
import '../../../utils/app_helpers.dart';
import '../../../utils/title_case.dart';
import '../bloc/wallet_bloc.dart';
import '../widgets/withdrawl_filter_sheet.dart';
import '../widgets/withdrawl_request_card_widget.dart';

class WithdrawalRequestScreen extends StatefulWidget {
  const WithdrawalRequestScreen({super.key});

  @override
  State<WithdrawalRequestScreen> createState() =>
      _WithdrawalRequestScreenState();
}

class _WithdrawalRequestScreenState extends State<WithdrawalRequestScreen> {
  int page = 1;
  int limit = 99999999999999;
  int total = 0;
  void _fetchWithdrawalRequests() {
    context.read<WalletBloc>().add(FetchWithdrawalRequestsEvent(
        page: page,
        limit: limit,
        status: selectedStatus == 'all' ? null : selectedStatus));
  }

  void _cancelWithdrawalRequest(int id) {
    context.read<WalletBloc>().add(CancelWithdrawalRequestEvent(requestId: id));
  }

  @override
  void initState() {
    super.initState();
    _fetchWithdrawalRequests();
  }

  List<String> statuses = [
    'all',
    'pending',
    'approved',
    'rejected',
    'cancelled'
  ];
  String selectedStatus = 'all';
  @override
  Widget build(BuildContext context) => Scaffold(
        body: AppGradientBg(
          child: TransWhiteBgWidget(
            child: SafeArea(
              bottom: false,
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: AppCustomAppbar(
                      centerTitle: 'Withdrawal Request',
                    ),
                  ),
                  const SizedBox(height: 24),
                  Expanded(
                    child: Container(
                      width: AppHelpers.getScreenWidth(context),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          color: AppHelpers.isDarkMode(context)
                              ? AppColors.cardDark
                              : AppColors.white,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(32),
                            topRight: Radius.circular(32),
                          )),
                      child: BlocConsumer<WalletBloc, WalletState>(
                        listener: (context, state) {
                          if (state is CancelWithdrawalRequestSuccess) {
                            AppHelpers.showSnackBar(context,
                                'Withdrawal request cancelled successfully',
                                backgroundColor: AppColors.success);
                            selectedStatus = 'all';
                            page = 1;
                            limit = 10;
                            _fetchWithdrawalRequests();
                          }
                          if (state is CancelWithdrawalRequestError) {
                            AppHelpers.showSnackBar(context, state.message,
                                backgroundColor: AppColors.error);
                            selectedStatus = 'all';
                            page = 1;
                            limit = 10;
                            _fetchWithdrawalRequests();
                          }
                          if (state is FetchWithdrawalRequestsError) {
                            AppHelpers.showSnackBar(context, state.message,
                                backgroundColor: AppColors.error);
                          }
                        },
                        builder: (context, state) {
                          if (state is FetchWithdrawalRequestsLoading &&
                              state.data == null) {
                            return _initalLoadingWidget();
                          }
                          if (state is FetchWithdrawalRequestsSuccess &&
                              state.data != null) {
                            total = state.data?.data?.total ?? 0;
                            page = state.data?.data?.page ?? 1;
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: AppHelpers.getScreenWidth(context),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Withdrawal Requests',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                            color:
                                                AppHelpers.isDarkMode(context)
                                                    ? AppColors.white
                                                    : AppColors.textPrimary),
                                      ),
                                      InkWell(
                                        onTap: () async {
                                          await showAppSheet(
                                            context: context,
                                            title: 'Filter',
                                            child: WithdrawalFilterSheet(
                                              statuses: statuses,
                                              selectedStatus: selectedStatus,
                                              onSelect: (status) {
                                                page = 1;
                                                limit = limit;
                                                selectedStatus = status;

                                                _fetchWithdrawalRequests();
                                              },
                                            ),
                                          );
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16),
                                          child: Row(
                                            children: [
                                              Text(
                                                toTitleCase(selectedStatus),
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                  color: AppColors.primary,
                                                ),
                                              ),
                                              const SizedBox(width: 4),
                                              const Icon(
                                                Icons
                                                    .keyboard_arrow_down_rounded,
                                                color: AppColors.primary,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Text(
                                  'Showing all withdrawal requests',
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.textSecondary),
                                ),
                                const SizedBox(height: 12),
                                Divider(
                                  color: AppColors.grey.withValues(alpha: 0.1),
                                  thickness: 1,
                                ),
                                const SizedBox(height: 16),
                                Expanded(
                                  child: total > 0
                                      ? ListView.builder(
                                          itemCount: total,
                                          itemBuilder: (context, index) =>
                                              WithdrawlRequestCardWidget(
                                            request: state
                                                .data?.data?.requests?[index],
                                            onCancelRequest: () {
                                              _cancelWithdrawalRequest(state
                                                      .data
                                                      ?.data
                                                      ?.requests?[index]
                                                      .id ??
                                                  0);
                                              Navigator.pop(context);
                                            },
                                          ),
                                        )
                                      : const Center(
                                          child: Text(
                                              'No withdrawal requests found')),
                                ),
                              ],
                            );
                          }
                          if (state is FetchWithdrawalRequestsError) {
                            return _errorWidget(state.message);
                          }
                          return _initalLoadingWidget();
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
}

Widget _initalLoadingWidget() => const Center(
        child: CircularProgressIndicator.adaptive(
      valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
    ));

Widget _errorWidget(String message) => Center(
      child: Text(message),
    );
