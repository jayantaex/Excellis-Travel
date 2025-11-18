import 'package:excellistravel/core/utils/app_helpers.dart';
import 'package:excellistravel/core/utils/storage_service.dart';
import 'package:excellistravel/core/widgets/no_login_widget.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_styles.dart';
import '../../../../core/widgets/app_custom_appbar.dart';
import '../../../../core/widgets/trans_white_bg_widget.dart';
import '../widgets/filter_sheet.dart';
import '../widgets/no_sales.dart';

class SalesScreen extends StatefulWidget {
  const SalesScreen({super.key});

  @override
  State<SalesScreen> createState() => _SalesScreenState();
}

class _SalesScreenState extends State<SalesScreen> {
  String? token;
  double totalSales = 25600.0;

  @override
  void initState() {
    Future.microtask(() async {
      token = await StorageService.getAccessToken();
      setState(() {});
    });
    super.initState();
  }

  @override
  // ignore: prefer_expression_function_bodies
  Widget build(BuildContext context) {
    return Scaffold(
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
                      await filterSheet(context: context);
                    },
                    icon: const Icon(Icons.filter_alt, color: AppColors.white)),
              ),
              Expanded(
                child: token == null || token!.isEmpty
                    ? const Center(child: NotLoginWidget())
                    : totalSales == 0.0
                        ? const NoSales()
                        : Column(
                            children: [
                              const SizedBox(height: 35),
                              Text('₹${totalSales.toStringAsFixed(2)}',
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
                                  width: AppHelpers.getScreenWidth(context),
                                  decoration: BoxDecoration(
                                    color: AppColors.white,
                                    borderRadius: BorderRadius.circular(32),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Tickets(15)',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.black),
                                      ),
                                      const SizedBox(height: 18),
                                      Expanded(
                                        child: ListView.builder(
                                          itemCount: 5,
                                          itemBuilder: (BuildContext context,
                                                  int index) =>
                                              const ExpansionTile(
                                            shape: Border(),
                                            tilePadding: EdgeInsets.all(0),
                                            leading: CircleAvatar(
                                              child: Icon(Icons.flight,
                                                  size: 16,
                                                  color:
                                                      AppColors.primaryLight),
                                            ),
                                            title: Text('#RBMI4L0W00VIQUP',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                    color: AppColors.black)),
                                            subtitle: Text(
                                                '18 Nov 2025 | 02:30 PM',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: AppColors.grey)),
                                            trailing: Text('+₹1,00.00',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w600,
                                                    color: AppColors.success)),
                                            children: [
                                              ListTile(
                                                leading: CircleAvatar(
                                                  child: Icon(Icons.person,
                                                      size: 16,
                                                      color: AppColors
                                                          .primaryLight),
                                                ),
                                                contentPadding:
                                                    EdgeInsets.all(0),
                                                title: Text('User: Agent Vinod',
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color:
                                                            AppColors.black)),
                                                subtitle: Text(
                                                  'Amount: ₹12,500.00',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: AppColors.grey),
                                                ),
                                                trailing: Text('+₹1,00.00',
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: AppColors.grey)),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
