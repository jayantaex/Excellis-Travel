import 'package:excellistravel/core/constants/app_styles.dart';
import 'package:excellistravel/core/utils/app_helpers.dart';
import 'package:excellistravel/core/widgets/app_custom_appbar.dart';
import 'package:excellistravel/core/widgets/app_gradient_bg.dart';
import 'package:excellistravel/core/widgets/trans_white_bg_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/wallet_bloc.dart';
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
  String selectedFilter = 'All';

  // Sample transaction data - Replace with actual data from your backend
  final List<Map<String, String>> _allTransactions = [
    {
      'title': 'Flight Booking',
      'date': '5 Dec 2025, 10:30 AM',
      'amount': '12500.00',
      'type': 'debit',
      'description': 'DEL to BOM - AI 101',
      'transactionId': 'TXN123456789',
    },
    {
      'title': 'Wallet Recharge',
      'date': '4 Dec 2025, 02:15 PM',
      'amount': '5000.00',
      'type': 'credit',
      'description': 'UPI Payment',
      'transactionId': 'TXN123456788',
    },
    {
      'title': 'Refund',
      'date': '3 Dec 2025, 11:45 AM',
      'amount': '2500.00',
      'type': 'credit',
      'description': 'Booking Cancellation',
      'transactionId': 'TXN123456787',
    },
    {
      'title': 'Hotel Booking',
      'date': '2 Dec 2025, 09:20 AM',
      'amount': '8500.00',
      'type': 'debit',
      'description': 'Taj Hotel - 2 Nights',
      'transactionId': 'TXN123456786',
    },
    {
      'title': 'Cashback',
      'date': '1 Dec 2025, 06:30 PM',
      'amount': '250.00',
      'type': 'credit',
      'description': 'Promotional Offer',
      'transactionId': 'TXN123456785',
    },
    {
      'title': 'Flight Booking',
      'date': '30 Nov 2025, 03:15 PM',
      'amount': '15000.00',
      'type': 'debit',
      'description': 'BOM to GOA - 6E 234',
      'transactionId': 'TXN123456784',
    },
    {
      'title': 'Wallet Recharge',
      'date': '29 Nov 2025, 01:00 PM',
      'amount': '10000.00',
      'type': 'credit',
      'description': 'Net Banking',
      'transactionId': 'TXN123456783',
    },
    {
      'title': 'Seat Selection',
      'date': '28 Nov 2025, 04:45 PM',
      'amount': '500.00',
      'type': 'debit',
      'description': 'Extra Legroom Seat',
      'transactionId': 'TXN123456782',
    },
  ];

  @override
  void initState() {
    super.initState();
    _FetchWalletBalance();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      setState(() {
        switch (_tabController.index) {
          case 0:
            selectedFilter = 'All';
            break;
          case 1:
            selectedFilter = 'Credit';
            break;
          case 2:
            selectedFilter = 'Debit';
            break;
        }
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<Map<String, String>> get _filteredTransactions {
    if (selectedFilter == 'All') {
      return _allTransactions;
    } else if (selectedFilter == 'Credit') {
      return _allTransactions
          .where((txn) => txn['type']?.toLowerCase() == 'credit')
          .toList();
    } else {
      return _allTransactions
          .where((txn) => txn['type']?.toLowerCase() == 'debit')
          .toList();
    }
  }

  // Calculate total credit and debit
  double get _totalCredit => _allTransactions
      .where((txn) => txn['type']?.toLowerCase() == 'credit')
      .fold(0.0,
          (sum, txn) => sum + (double.tryParse(txn['amount'] ?? '0') ?? 0));

  double get _totalDebit => _allTransactions
      .where((txn) => txn['type']?.toLowerCase() == 'debit')
      .fold(0.0,
          (sum, txn) => sum + (double.tryParse(txn['amount'] ?? '0') ?? 0));

  double get _availableBalance => _totalCredit - _totalDebit;

  void _showWithdrawalSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => WithdrawalSheet(
        availableBalance: _availableBalance,
      ),
    );
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
                      child: CircularProgressIndicator(
                        color: AppColors.primary,
                      ),
                    );
                  }
                  if (state is WalletError) {
                    return Center(
                      child: Text(state.message),
                    );
                  }
                  if (state is! WalletLoaded) {
                    return const SizedBox.shrink();
                  }
                  final wallet = state.wallet;
                  return Column(
                    children: [
                      // App Bar
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: AppCustomAppbar(
                          centerTitle: 'My Wallet',
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
                                      value: _totalCredit.toStringAsFixed(2),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: TypeCardWidget(
                                      type: 'dr',
                                      value: _totalDebit.toStringAsFixed(2),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),

                            // Withdrawal Button
                            SizedBox(
                              width: double.infinity,
                              height: 44,
                              child: ElevatedButton.icon(
                                onPressed: _showWithdrawalSheet,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.white,
                                  foregroundColor: AppColors.primary,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                icon: const Icon(Icons.account_balance_outlined,
                                    size: 18),
                                label: const Text(
                                  'Withdraw Money',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 12),
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
                                    width: 1,
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
                                child: _filteredTransactions.isEmpty
                                    ? Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.receipt_long_outlined,
                                              size: 64,
                                              color: AppColors.textHint
                                                  .withOpacity(0.5),
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
                                              'Your ${selectedFilter.toLowerCase()} transactions will appear here',
                                              style: const TextStyle(
                                                fontSize: 13,
                                                color: AppColors.textHint,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    : ListView.builder(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 20,
                                        ),
                                        itemCount: _filteredTransactions.length,
                                        itemBuilder: (context, index) {
                                          final transaction =
                                              _filteredTransactions[index];
                                          return TransactionCardWidget(
                                            title: transaction['title'] ?? '',
                                            date: transaction['date'] ?? '',
                                            amount:
                                                transaction['amount'] ?? '0.00',
                                            type:
                                                transaction['type'] ?? 'debit',
                                            description:
                                                transaction['description'],
                                            transactionId:
                                                transaction['transactionId'],
                                          );
                                        },
                                      ),
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

  void _FetchWalletBalance() {
    context.read<WalletBloc>().add(const FetchWalletEvent());
  }

  // void _FetchWalletTransactions() {
  //   context.read<WalletBloc>().add(const FetchWalletTransactionsEvent());
  // }
}

// Withdrawal Bottom Sheet Widget
