import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/app_styles.dart';
import '../../../../core/widgets/app_custom_appbar.dart';
import '../../../../core/widgets/app_gradient_bg.dart';
import '../widgets/faq_sheet.dart';
import '../widgets/help_and_support_sheet.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  String appVersion = '1.0.0';
  bool notificationOn = false;

  @override
  Widget build(BuildContext context) => Scaffold(
      body: AppGradientBg(
        child: SafeArea(
          bottom: false,
          child: Column(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: AppCustomAppbar(
                  centerTitle: 'Settings',
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(top: 24),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  decoration: const BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        contentPadding: const EdgeInsets.all(0),
                        title: const Text('Notifications',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: AppColors.black,
                            )),
                        subtitle: const Text('You will receive notifications',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: AppColors.grey,
                            )),
                        trailing: Transform.scale(
                          scale: 0.8,
                          child: CupertinoSwitch(
                            value: notificationOn,
                            onChanged: (bool value) {
                              setState(() {
                                notificationOn = value;
                              });
                            },
                          ),
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          showHelpAndSupportSheet(context: context);
                        },
                        contentPadding: const EdgeInsets.all(0),
                        title: const Text('Help & Support',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: AppColors.black,
                            )),
                        subtitle: const Text('we are here for you 24/7',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: AppColors.grey,
                            )),
                        trailing: const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: AppColors.primary,
                          size: 16,
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          showFaqSheet(context: context);
                        },
                        contentPadding: const EdgeInsets.all(0),
                        title: const Text('FAQs',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: AppColors.black,
                            )),
                        subtitle: const Text('Frequently asked questions',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: AppColors.grey,
                            )),
                        trailing: const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: AppColors.primary,
                          size: 16,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: AppColors.white,
        height: 55,
        child: Column(
          children: <Widget>[
            Text('V$appVersion',
                style: const TextStyle(fontSize: 16, color: AppColors.grey)),
          ],
        ),
      ),
    );
}
