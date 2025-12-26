import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/app_styles.dart';
import '../../../core/errors/error_screen.dart';
import '../../../core/widgets/app_custom_appbar.dart';
import '../../../core/widgets/app_gradient_bg.dart';
import '../../../core/widgets/app_sheet.dart';
import '../../../core/widgets/trans_white_bg_widget.dart';
import '../../../utils/app_helpers.dart';
import '../bloc/wallet_bloc.dart';
import '../widgets/transaction_card_widget.dart';
import '../widgets/type_card_widget.dart';
import '../widgets/withdrawl_sheet.dart';

class CreditWalletScreen extends StatefulWidget {
  const CreditWalletScreen({super.key});

  @override
  State<CreditWalletScreen> createState() => _CreditWalletScreenState();
}

class _CreditWalletScreenState extends State<CreditWalletScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String selectedFilter = 'all';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      final newFilter = switch (_tabController.index) {
        0 => 'all',
        1 => 'credit',
        2 => 'debit',
        _ => 'all',
      };

      if (newFilter != selectedFilter) {
        setState(() {
          selectedFilter = newFilter;
        });
        // Dispatch filter event to bloc (client-side filtering)
        context.read<WalletBloc>().add(FilterTransactionsEvent(
              filterType: newFilter,
            ));
      }
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: AppGradientBg(
          child: TransWhiteBgWidget(
            child: SafeArea(
              child: BlocConsumer<WalletBloc, WalletState>(
                listener: (context, state) {},
                builder: (context, state) {
                  if (state is WalletLoading) {
                    return const Center(
                      child: CircularProgressIndicator(color: AppColors.white),
                    );
                  }
                  if (state is WalletError) {
                    return ErrorScreen(
                      errorMessage: state.message,
                      bg: AppColors.white,
                    );
                  }
                  if (state is! WalletLoaded) {
                    return const SizedBox.shrink();
                  }
                  return Column(
                    children: [
                      // App Bar
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: AppCustomAppbar(
                          centerTitle: 'Credit Wallet',
                        ),
                      ),

                      // Balance Section
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            const SizedBox(height: 4),
                            // Total Balance
                            Text(
                              '₹${state.wallet?.balance?.toStringAsFixed(2) ?? '0.00'}',
                              style: const TextStyle(
                                fontSize: 36,
                                color: AppColors.white,
                                fontWeight: FontWeight.w700,
                                letterSpacing: -1,
                              ),
                            ),
                            const SizedBox(height: 2),
                            const Text(
                              'Available Balance',
                              style: TextStyle(
                                fontSize: 13,
                                color: AppColors.white,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.3,
                              ),
                            ),
                            const SizedBox(height: 12),

                            // Credit and Debit Cards
                            SizedBox(
                              height: 85,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: TypeCardWidget(
                                      type: 'cr',
                                      value: state.wallet?.totoalCredit
                                              ?.toStringAsFixed(2) ??
                                          '0.00',
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: TypeCardWidget(
                                      type: 'dr',
                                      value: state.wallet?.totalDebt
                                              ?.toStringAsFixed(2) ??
                                          '0.00',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),

                      // Transaction List Section
                      Expanded(
                        child: Container(
                          width: AppHelpers.getScreenWidth(context),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(32),
                              topRight: Radius.circular(32),
                            ),
                            color: AppColors.background,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 16),

                              // Transaction Header
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  'Transaction History',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.textPrimary,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 12),

                              // Filter Tabs
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: AppColors.border,
                                  ),
                                ),
                                child: TabBar(
                                  controller: _tabController,
                                  indicator: BoxDecoration(
                                    color: AppColors.primary,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  indicatorSize: TabBarIndicatorSize.tab,
                                  indicatorPadding: const EdgeInsets.all(4),
                                  labelColor: AppColors.white,
                                  unselectedLabelColor: AppColors.textSecondary,
                                  labelStyle: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  unselectedLabelStyle: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  dividerColor: Colors.transparent,
                                  tabs: const [
                                    Tab(text: 'All'),
                                    Tab(text: 'Credits'),
                                    Tab(text: 'Debits'),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 12),

                              // Transaction List
                              // Expanded(
                              //   child: RefreshIndicator(
                              //     onRefresh: () async {},
                              //     child: ListView.builder(
                              //       physics:
                              //           const AlwaysScrollableScrollPhysics(),
                              //       padding: const EdgeInsets.symmetric(
                              //           horizontal: 20),
                              //       itemCount:
                              //           (filteredTransactions?.length ?? 0) +
                              //               (state.isLoadingMore ? 1 : 0),
                              //       itemBuilder: (context, index) {
                              //         // Show loading indicator at the end
                              //         if (index ==
                              //             filteredTransactions?.length) {
                              //           return const Padding(
                              //             padding: EdgeInsets.all(16.0),
                              //             child: Center(
                              //               child: CircularProgressIndicator(
                              //                 color: AppColors.primary,
                              //               ),
                              //             ),
                              //           );
                              //         }

                              //         final transaction =
                              //             filteredTransactions?[index];
                              //         return TransactionCardWidget(
                              //           title:
                              //               transaction?.transactionReference ??
                              //                   '',
                              //           date: AppHelpers.formatDate(
                              //               DateTime.parse(
                              //                   transaction?.createdAt ??
                              //                       '2025-01-01')),
                              //           amount: transaction?.amount ?? '0.00',
                              //           type: transaction?.transactionType ??
                              //               'debit',
                              //           description:
                              //               transaction?.description ?? '',
                              //           transactionId:
                              //               transaction?.transactionReference ??
                              //                   '',
                              //         );
                              //       },
                              //     ),
                              //   ),
                              // ),
                              const SizedBox(height: 16),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      );
}
