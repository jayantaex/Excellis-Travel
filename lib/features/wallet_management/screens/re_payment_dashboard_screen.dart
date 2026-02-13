import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/app_styles.dart';
import '../../../core/widgets/app_custom_appbar.dart';
import '../../../core/widgets/app_gradient_bg.dart';
import '../../../core/widgets/app_sheet.dart';
import '../../../core/widgets/primary_button.dart';
import '../../../core/widgets/trans_white_bg_widget.dart';
import '../../../utils/app_helpers.dart';
import '../../../utils/title_case.dart';
import '../bloc/wallet_bloc.dart';
import '../data/models/overdue_data_model.dart';
import '../data/models/repayment_data_model.dart';

class RePaymentDashboardScreen extends StatefulWidget {
  const RePaymentDashboardScreen({super.key});

  @override
  State<RePaymentDashboardScreen> createState() =>
      _RePaymentDashboardScreenState();
}

class _RePaymentDashboardScreenState extends State<RePaymentDashboardScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    fetchRePayment();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void fetchRePayment() async {
    context
        .read<WalletBloc>()
        .add(const FetchRePaymentEvent(page: 1, limit: 10));
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: AppGradientBg(
          child: BlocListener<WalletBloc, WalletState>(
            listener: (context, state) async {
              log('state::::::: ${state.toString()}');
              if (state is RePaySuccess) {
                Navigator.of(context).pop();
                await AppHelpers.showSnackBar(context, state.message,
                    backgroundColor: AppColors.success);
                fetchRePayment();
                return;
              } else if (state is RePayError) {
                Navigator.of(context).pop();

                log('state Message::::::: ${state.message}');
                await AppHelpers.showSnackBar(context, state.message,
                    backgroundColor: AppColors.error);
                fetchRePayment();
                return;
              }
            },
            child: TransWhiteBgWidget(
              child: SafeArea(
                bottom: false,
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: AppCustomAppbar(
                        centerTitle: 'Re Payment Dashboard',
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Tab Bar Container
                    Expanded(
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
                          children: [
                            const SizedBox(height: 16),
                            Container(
                              margin: const EdgeInsets.symmetric(),
                              decoration: BoxDecoration(
                                color: AppHelpers.isDarkMode(context)
                                    ? AppColors.cardDark
                                    : AppColors.white.withValues(alpha: 0.1),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: AppHelpers.isDarkMode(context)
                                      ? AppColors.border.withValues(alpha: 0.1)
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
                                  Tab(text: 'Overdue Repayments'),
                                  Tab(text: 'Pending Repayments'),
                                ],
                              ),
                            ),
                            const SizedBox(height: 16),
                            // Tab Bar View
                            Expanded(
                              child: BlocBuilder<WalletBloc, WalletState>(
                                builder: (context, state) => state
                                        is WalletLoading
                                    ? const Center(
                                        child: CircularProgressIndicator())
                                    : state is WalletError
                                        ? Center(child: Text(state.message))
                                        : state is WalletLoading
                                            ? const Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              )
                                            : state is FetchRePaymentSuccess
                                                ? TabBarView(
                                                    controller: _tabController,
                                                    children: [
                                                      _buildOverdueRepaymentsTab(
                                                          state.overDueData ??
                                                              []),
                                                      _buildPendingRepaymentsTab(
                                                          state.pendingRepaymentData ??
                                                              []),
                                                    ],
                                                  )
                                                : const Center(
                                                    child: Text(
                                                        'Failed to fetch overdue repayments')),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

  Widget _buildOverdueRepaymentsTab(List<OverDueDataModel> data) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: data.isEmpty
            ? const Center(
                child: Text('No Overdue Repayments',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColors.grey)))
            : Center(
                child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) => ListTile(
                    contentPadding: const EdgeInsets.all(0),
                    title: Text(
                      '${toTitleCase(data[index].recipient?.firstName ?? '')} ${toTitleCase(data[index].recipient?.lastName ?? '')} ${data[index].recipient?.userCode ?? ''}',
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(
                      '${AppHelpers.formatDate(DateTime.parse(data[index].repaymentDate ?? ''), pattern: 'dd MMM, yyyy')} | ${AppHelpers.formatCurrency(double.parse(data[index].amount ?? '0'))}',
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: AppColors.grey),
                    ),
                    trailing: InkWell(
                      onTap: () async {
                        showAppSheet(
                          context: context,
                          title: 'Confirm Repayment',
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  'Are you sure you want to repay this credit transaction?'),
                              const SizedBox(height: 16),
                              _infoField(),
                              const SizedBox(height: 16),
                              _buildRow(
                                  title: 'Amount:',
                                  value: AppHelpers.formatCurrency(
                                      double.parse(data[index].amount ?? '0'))),
                              const SizedBox(height: 16),
                              _buildRow(
                                  title: 'Due Date:',
                                  value: AppHelpers.formatDate(
                                      DateTime.parse(
                                          data[index].repaymentDate ?? ''),
                                      pattern: 'dd MMM, yyyy')),
                              const SizedBox(height: 16),
                              _buildRow(
                                  title: 'Recipient:',
                                  value:
                                      '${toTitleCase(data[index].recipient?.firstName ?? '')} ${toTitleCase(data[index].recipient?.lastName ?? '')} ${data[index].recipient?.userCode ?? ''}'),
                              const SizedBox(height: 24),
                              AppPrimaryButton(
                                title: 'Confirm Payment',
                                isLoading: false,
                                onPressed: () {
                                  context.read<WalletBloc>().add(
                                        RePayEvent(
                                          body: <String, dynamic>{
                                            'creditTransactionId':
                                                data[index].id,
                                            'paymentMethod': 'wallet'
                                          },
                                        ),
                                      );
                                },
                              )
                            ],
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.primary),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text(
                          'Repay',
                          style:
                              TextStyle(fontSize: 12, color: AppColors.primary),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
      );

  Widget _buildPendingRepaymentsTab(List<PendingRepaymentDataModel> data) =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: data.isEmpty
            ? const Center(
                child: Text('No Pending Repayments',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColors.grey)))
            : ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) => ListTile(
                  contentPadding: const EdgeInsets.all(0),
                  title: Text(
                    '${toTitleCase(data[index].recipient?.firstName ?? '')} ${toTitleCase(data[index].recipient?.lastName ?? '')} ${data[index].recipient?.userCode ?? ''}',
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text(
                    '${AppHelpers.formatDate(DateTime.parse(data[index].repaymentDate ?? ''), pattern: 'dd MMM, yyyy')} | ${AppHelpers.formatCurrency(double.parse(data[index].amount ?? '0'))}',
                    style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.grey),
                  ),
                  trailing: InkWell(
                    onTap: () async {
                      showAppSheet(
                        context: context,
                        title: 'Confirm Repayment',
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                                'Are you sure you want to repay this credit transaction?'),
                            const SizedBox(height: 16),
                            _infoField(),
                            const SizedBox(height: 16),
                            _buildRow(
                                title: 'Amount:',
                                value: AppHelpers.formatCurrency(
                                    double.parse(data[index].amount ?? '0'))),
                            const SizedBox(height: 16),
                            _buildRow(
                                title: 'Due Date:',
                                value: AppHelpers.formatDate(
                                    DateTime.parse(
                                        data[index].repaymentDate ?? ''),
                                    pattern: 'dd MMM, yyyy')),
                            const SizedBox(height: 16),
                            _buildRow(
                                title: 'Recipient:',
                                value:
                                    '${toTitleCase(data[index].recipient?.firstName ?? '')} ${toTitleCase(data[index].recipient?.lastName ?? '')} ${data[index].recipient?.userCode ?? ''}'),
                            const SizedBox(height: 24),
                            AppPrimaryButton(
                              title: 'Confirm Payment',
                              isLoading: false,
                              onPressed: () {
                                context.read<WalletBloc>().add(
                                      RePayEvent(
                                        body: <String, dynamic>{
                                          'creditTransactionId': data[index].id,
                                          'paymentMethod': 'wallet'
                                        },
                                      ),
                                    );
                              },
                            )
                          ],
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.primary),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text('Repay',
                          style: TextStyle(
                              fontSize: 12, color: AppColors.primary)),
                    ),
                  ),
                ),
              ),
      );
}

Widget _buildRow({required String title, required String value}) => Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        ),
        Text(
          value,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        ),
      ],
    );

Widget _infoField() => Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.info),
        color: AppColors.info.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const ListTile(
        contentPadding: EdgeInsets.all(0),
        leading: Icon(
          Icons.info,
          color: AppColors.info,
        ),
        title: Text(
          'The amount will be deducted from your personal wallet balance.',
          style: TextStyle(
              fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.info),
        ),
      ),
    );
