import 'package:excellistravel/core/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/app_styles.dart';
import '../../../core/errors/error_screen.dart';
import '../../../core/widgets/app_custom_appbar.dart';
import '../../../core/widgets/app_gradient_bg.dart';
import '../../../core/widgets/trans_white_bg_widget.dart';
import '../../../utils/app_helpers.dart';
import '../bloc/wallet_bloc.dart';
import '../widgets/credit_wallet_transaction_card.dart';
import '../widgets/credit_wallet_type_card.dart';
import '../widgets/type_card_widget.dart';

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
                    return Column(
                      children: [
                        const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child:
                                AppCustomAppbar(centerTitle: 'Credit Wallet')),
                        const SizedBox(height: 16),
                        const Text('₹ 1000',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.w700,
                              color: AppColors.white,
                            )),
                        const Text('Credit Balance',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: AppColors.white,
                            )),
                        const SizedBox(height: 16),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: SizedBox(
                            height: 85,
                            child: Row(
                              children: [
                                Expanded(
                                  child: CreditWalletTypeCard(
                                    title: 'Used Balance',
                                    value: '2000',
                                  ),
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: CreditWalletTypeCard(
                                    title: 'Total Balance',
                                    value: '2000',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Expanded(
                          child: Container(
                            width: AppHelpers.getScreenWidth(context),
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            decoration: const BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(32),
                                topRight: Radius.circular(32),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 16),
                                const Text(
                                  'Transaction History',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.textPrimary,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                SizedBox(
                                  height:
                                      AppHelpers.getScreenHeight(context) * 0.6,
                                  child: ListView.builder(
                                    itemCount: 20,
                                    itemBuilder: (context, index) =>
                                        CreditWalletTransactionCard(
                                            title: 'Transaction $index',
                                            date: '2025-01-01',
                                            amount: '100',
                                            type: 'credit',
                                            status: 'pending'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                  return Container();
                },
              ),
            ),
          ),
        ),
      );
}
