import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_styles.dart';
import '../../../core/errors/error_screen.dart';
import '../../../core/widgets/app_custom_appbar.dart';
import '../../../core/widgets/app_gradient_bg.dart';
import '../../../core/widgets/app_sheet.dart';
import '../../../core/widgets/trans_white_bg_widget.dart';
import '../../../utils/app_helpers.dart';
import '../../payment/payment_module.dart';
import '../bloc/wallet_bloc.dart';
import '../data/models/transaction_model.dart';
import '../widgets/deposit_sheet.dart';
import '../widgets/transaction_card_widget.dart';
import '../widgets/type_card_widget.dart';
import '../widgets/withdrawl_sheet.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int limit = 2000000;
  String selectedFilter = 'all';
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _amountController =
      TextEditingController(text: '10000');
  bool _isFetching = false;

  @override
  void initState() {
    super.initState();
    // _scrollController.addListener(_onScroll);
    _fetchWalletBalance();
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
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  List<Datam>? _getFilteredTransactions(TransactionDataModel? transactions) {
    if (selectedFilter == 'all') {
      return transactions?.datam ?? [];
    } else if (selectedFilter == 'credit') {
      return transactions?.datam
          ?.where((txn) => txn.transactionType?.toLowerCase() == 'credit')
          .toList();
    } else {
      return transactions?.datam
          ?.where((txn) => txn.transactionType?.toLowerCase() == 'debit')
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: AppGradientBg(
          child: TransWhiteBgWidget(
            child: SafeArea(
              child: BlocConsumer<WalletBloc, WalletState>(
                listener: (context, state) {
                  if (state is WalletLoaded && !state.isLoadingMore) {
                    _isFetching = false;
                  }
                  if (state is WalletError) {
                    _isFetching = false;
                  }

                  if (state is SubmitWithdrawalSuccess) {
                    AppHelpers.showSnackBar(
                        context, 'Withdrawal request submitted successfully',
                        backgroundColor: AppColors.success);
                    _fetchWalletBalance();
                  }
                  if (state is SubmitWithdrawalError) {
                    AppHelpers.showSnackBar(context, state.message,
                        backgroundColor: AppColors.error);
                    _fetchWalletBalance();
                  }
                },
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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: AppCustomAppbar(
                          centerTitle: 'My Wallet',
                          trailing: InkWell(
                            onTap: () {
                              showMenu(
                                  context: context,
                                  position: RelativeRect.fromLTRB(
                                    MediaQuery.of(context).size.width,
                                    100,
                                    0,
                                    MediaQuery.of(context).size.height,
                                  ),
                                  items: [
                                    PopupMenuItem(
                                      value: 'Withdraw Money',
                                      child: const Text('Withdraw Money'),
                                      onTap: () {
                                        final walletBloc =
                                            context.read<WalletBloc>();
                                        showAppSheet(
                                          context: context,
                                          title: 'Withdraw Money',
                                          child: BlocProvider.value(
                                            value: walletBloc,
                                            child: WithdrawalSheet(
                                              availableBalance:
                                                  state.wallet?.balance ?? 0.0,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                    PopupMenuItem(
                                      value: 'Deposit',
                                      child: const Text('Deposit Money'),
                                      onTap: () {
                                        showAppSheet(
                                          context: context,
                                          title: 'Deposit Money',
                                          child: DepositSheet(
                                              amountController:
                                                  _amountController),
                                          submitButtonRequired: true,
                                          onSubmitPressed: () {
                                            final double doubleAmount =
                                                double.parse(
                                                    _amountController.text);

                                            context.pushNamed(
                                                PaymentModule
                                                    .paymentProcessingName,
                                                extra: {
                                                  'amount': doubleAmount,
                                                  'description':
                                                      'Deposit Money in Wallet',
                                                  'mobile': '',
                                                  'email': '',
                                                  'orderFor': 'wallet',
                                                });
                                          },
                                        );
                                      },
                                    ),
                                  ]);
                            },
                            child: CircleAvatar(
                              backgroundColor:
                                  AppColors.white.withValues(alpha: 0.2),
                              child: const Icon(
                                Icons.more_vert_rounded,
                                color: AppColors.white,
                              ),
                            ),
                          ),
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
                              AppHelpers.formatCurrency(
                                  state.wallet?.balance ?? 0.0),
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
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(32),
                              topRight: Radius.circular(32),
                            ),
                            color: AppHelpers.isDarkMode(context)
                                ? AppColors.secondaryDark
                                : AppColors.white,
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
                                  ),
                                ),
                              ),
                              const SizedBox(height: 12),

                              // Filter Tabs
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                decoration: BoxDecoration(
                                  color: AppHelpers.isDarkMode(context)
                                      ? AppColors.cardDark
                                      : AppColors.white.withValues(alpha: 0.1),
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: AppHelpers.isDarkMode(context)
                                        ? AppColors.border
                                            .withValues(alpha: 0.1)
                                        : AppColors.border,
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
                              Expanded(
                                child: () {
                                  final filteredTransactions =
                                      _getFilteredTransactions(
                                          state.transactions);

                                  if (filteredTransactions?.isEmpty ??
                                      true && !state.isLoadingMore) {
                                    return Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.receipt_long_outlined,
                                            size: 64,
                                            color: AppColors.textHint
                                                .withValues(alpha: 0.5),
                                          ),
                                          const SizedBox(height: 16),
                                          const Text(
                                            'No transactions found',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.textSecondary,
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          Text(
                                            'Your $selectedFilter transactions will appear here',
                                            style: const TextStyle(
                                              fontSize: 13,
                                              color: AppColors.textHint,
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }

                                  return RefreshIndicator(
                                    onRefresh: () async {
                                      _fetchWalletBalance();
                                    },
                                    child: ListView.builder(
                                      physics:
                                          const AlwaysScrollableScrollPhysics(),
                                      controller: _scrollController,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      itemCount:
                                          (filteredTransactions?.length ?? 0) +
                                              (state.isLoadingMore ? 1 : 0),
                                      itemBuilder: (context, index) {
                                        // Show loading indicator at the end
                                        if (index ==
                                            filteredTransactions?.length) {
                                          return const Padding(
                                            padding: EdgeInsets.all(16.0),
                                            child: Center(
                                              child: CircularProgressIndicator(
                                                color: AppColors.primary,
                                              ),
                                            ),
                                          );
                                        }

                                        final transaction =
                                            filteredTransactions?[index];
                                        return TransactionCardWidget(
                                          status: transaction?.status ?? '',
                                          title: transaction
                                                  ?.transactionReference ??
                                              '',
                                          date: AppHelpers.formatDate(
                                              DateTime.parse(
                                                transaction?.createdAt ??
                                                    '2025-01-01',
                                              ),
                                              pattern: 'dd MMM yyyy'),
                                          amount: transaction?.amount ?? '0.00',
                                          type: transaction?.transactionType ??
                                              'debit',
                                          description:
                                              transaction?.description ?? '',
                                          transactionId: transaction
                                                  ?.transactionReference ??
                                              '',
                                        );
                                      },
                                    ),
                                  );
                                }(),
                              ),
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

  void _fetchWalletBalance() {
    context
        .read<WalletBloc>()
        .add(const FetchWalletEvent(limit: 99999999999999999, page: 1));
  }

  void _fetchWalletTransactions({
    required int page,
    required int limit,
  }) {
    log('Fetching wallet transactions $page $limit');
    context.read<WalletBloc>().add(FetchWalletTransactionsEvent(
          page: page,
          limit: limit,
        ));
  }
}

// Withdrawal Bottom Sheet Widget
