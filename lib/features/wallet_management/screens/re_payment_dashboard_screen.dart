import 'package:flutter/material.dart';

import '../../../core/constants/app_styles.dart';
import '../../../core/widgets/app_custom_appbar.dart';
import '../../../core/widgets/app_gradient_bg.dart';
import '../../../core/widgets/trans_white_bg_widget.dart';
import '../../../utils/app_helpers.dart';

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
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

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
                            margin: const EdgeInsets.symmetric(horizontal: 0),
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
                            child: TabBarView(
                              controller: _tabController,
                              children: [
                                // Overdue Repayments Tab
                                _buildOverdueRepaymentsTab(),
                                // Pending Repayments Tab
                                _buildPendingRepaymentsTab(),
                              ],
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
      );

  Widget _buildOverdueRepaymentsTab() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.warning_amber_rounded,
                size: 64,
                color: AppColors.warning.withValues(alpha: 0.7),
              ),
              const SizedBox(height: 16),
              Text(
                'No Overdue Repayments',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppHelpers.isDarkMode(context)
                      ? AppColors.white
                      : AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Your overdue repayments will appear here',
                style: TextStyle(
                  fontSize: 13,
                  color: AppColors.textHint,
                ),
              ),
            ],
          ),
        ),
      );

  Widget _buildPendingRepaymentsTab() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.pending_actions_rounded,
                size: 64,
                color: AppColors.info.withValues(alpha: 0.7),
              ),
              const SizedBox(height: 16),
              Text(
                'No Pending Repayments',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppHelpers.isDarkMode(context)
                      ? AppColors.white
                      : AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Your pending repayments will appear here',
                style: TextStyle(
                  fontSize: 13,
                  color: AppColors.textHint,
                ),
              ),
            ],
          ),
        ),
      );
}
