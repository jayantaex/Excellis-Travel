import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_styles.dart';
import '../../../core/errors/error_screen.dart';
import '../../../core/widgets/app_custom_appbar.dart';
import '../../../core/widgets/app_gradient_bg.dart';
import '../../../core/widgets/trans_white_bg_widget.dart';
import '../../../utils/app_helpers.dart';
import '../bloc/wallet_bloc.dart';
import '../data/models/custom_cr_transaction_model.dart';
import '../wallet_module.dart';
import '../widgets/credit_wallet_transaction_card.dart';
import '../widgets/credit_wallet_type_card.dart';

class CreditWalletScreen extends StatefulWidget {
  const CreditWalletScreen({super.key});

  @override
  State<CreditWalletScreen> createState() => _CreditWalletScreenState();
}

class _CreditWalletScreenState extends State<CreditWalletScreen> {
  int page = 1;
  //Pagination will not work.
  // transaction list is a custom response from the api. Basically its a list of combination of two api responses [Flight Booking via wallet and Credit Transaction].
  int limit = 999999999999999999;

  @override
  void initState() {
    super.initState();
    context.read<WalletBloc>().add(const FetchCreditBalanceEvent());
  }

  void _fetchCreditTransactions({required int page, required int limit}) {
    context.read<WalletBloc>().add(FetchCreditBalanceTransactionsEvent(
          page: page,
          limit: limit,
        ));
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: AppGradientBg(
          child: TransWhiteBgWidget(
            child: SafeArea(
              bottom: false,
              child: BlocConsumer<WalletBloc, WalletState>(
                listener: (context, state) {
                  if (state is FetchCreditBalanceSuccess) {
                    _fetchCreditTransactions(page: page, limit: limit);
                  }
                },
                builder: (context, state) {
                  if (state is FetchCreditBalanceLoading) {
                    return const Center(
                      child: CircularProgressIndicator(color: AppColors.white),
                    );
                  }
                  if (state is FetchCreditBalanceError) {
                    return ErrorScreen(
                      errorMessage: state.message,
                      bg: AppColors.white,
                    );
                  }
                  return Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: AppCustomAppbar(
                            centerTitle: 'Credit Wallet',
                            trailing: InkWell(
                              onTap: () {
                                context
                                    .pushNamed(WalletModule.rePaymentDashboard);
                              },
                              child: const Icon(
                                Icons.replay_rounded,
                                color: AppColors.white,
                              ),
                            ),
                          )),
                      const SizedBox(height: 16),
                      if (state is FetchCreditBalanceTransactionsSuccess)
                        Text(
                          AppHelpers.formatCurrency(
                              (state.availableBalance ?? 0.0),
                              symbol: '₹'),
                          style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w700,
                            color: AppColors.white,
                          ),
                        ),
                      const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: SizedBox(
                          height: 85,
                          child: Row(
                            children: [
                              if (state
                                  is FetchCreditBalanceTransactionsSuccess)
                                Expanded(
                                  child: CreditWalletTypeCard(
                                    title: 'Used Balance',
                                    amount:
                                        (state.data?.summary?.totalCredits ??
                                                0.0) -
                                            (state.availableBalance ?? 0.0),
                                  ),
                                ),
                              const SizedBox(width: 10),
                              if (state
                                  is FetchCreditBalanceTransactionsSuccess)
                                Expanded(
                                  child: CreditWalletTypeCard(
                                    title: 'Total Balance',
                                    amount: state.data?.summary?.totalCredits ??
                                        0.0,
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Expanded(
                        child: DefaultTabController(
                          length: 2,
                          child: Container(
                            width: AppHelpers.getScreenWidth(context),
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            decoration: BoxDecoration(
                              color: AppHelpers.isDarkMode(context)
                                  ? AppColors.cardDark
                                  : AppColors.white,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(32),
                                topRight: Radius.circular(32),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 12),

                                // TAB BAR
                                Text(
                                  'Credit Transaction History ',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: AppHelpers.isDarkMode(context)
                                          ? AppColors.white
                                          : AppColors.textPrimary),
                                ),
                                const Text(
                                  'Showing all credit transactions (received and used) and repayment history',
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.textSecondary),
                                ),
                                const SizedBox(height: 12),

                                if (state
                                    is FetchCreditBalanceTransactionsSuccess)
                                  Expanded(
                                    child: ListView.builder(
                                      itemCount: state.data?.data?.length ?? 0,
                                      itemBuilder: (context, index) =>
                                          CreditWalletTransactionCard(
                                        data: state.data?.data?[index] ??
                                            CreditTransactionData(),
                                      ),
                                    ),
                                  ),
                                const SizedBox(height: 25),
                              ],
                            ),
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
