import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/app_styles.dart';
import '../../../../core/widgets/app_sheet.dart';
import '../../../../utils/app_helpers.dart';
import '../../../../core/widgets/app_custom_appbar.dart';
import '../../../../core/widgets/app_gradient_bg.dart';
import '../../../auth/bloc/auth_bloc.dart';
import '../../../auth/presentation/widgets/delete_account_sheet.dart';
import '../../../auth/presentation/widgets/reset_pass_sheet.dart';
import '../widgets/faq_sheet.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  String appVersion = AppConstants.appVersion;
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
                BlocListener<AuthBloc, AuthState>(
                  listener: (context, state) {
                    if (state is PasswordResetFailure) {
                      AppHelpers.showSnackBar(context, state.message);
                    } else if (state is PasswordResetSuccess) {
                      AppHelpers.showSnackBar(
                          context, 'Password reset successful');
                    }
                  },
                  child: Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(top: 24),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 20),
                      decoration: BoxDecoration(
                        color: AppHelpers.isDarkMode(context)
                            ? AppColors.secondaryDark
                            : AppColors.white,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(32),
                          topRight: Radius.circular(32),
                        ),
                      ),
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            contentPadding: const EdgeInsets.all(0),
                            title: Text('Notifications',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: AppHelpers.isDarkMode(context)
                                      ? AppColors.white
                                      : AppColors.black,
                                )),
                            subtitle:
                                const Text('You will receive notifications',
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
                          // ListTile(
                          //   onTap: () async {
                          //     await showAppSheet(
                          //         context: context,
                          //         title: 'Help & Support',
                          //         child: HelpAndSupportSheet());
                          //   },
                          //   contentPadding: const EdgeInsets.all(0),
                          //   title: Text('Help & Support',
                          //       style: TextStyle(
                          //         fontSize: 15,
                          //         fontWeight: FontWeight.w600,
                          //         color: AppHelpers.isDarkMode(context)
                          //             ? AppColors.white
                          //             : AppColors.black,
                          //       )),
                          //   subtitle: const Text('we are here for you 24/7',
                          //       style: TextStyle(
                          //         fontSize: 12,
                          //         fontWeight: FontWeight.w400,
                          //         color: AppColors.grey,
                          //       )),
                          //   trailing: const Icon(
                          //     Icons.arrow_forward_ios_rounded,
                          //     color: AppColors.primary,
                          //     size: 16,
                          //   ),
                          // ),
                          ListTile(
                            onTap: () {
                              showFaqSheet(context: context);
                            },
                            contentPadding: const EdgeInsets.all(0),
                            title: Text('FAQs',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: AppHelpers.isDarkMode(context)
                                      ? AppColors.white
                                      : AppColors.black,
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
                          ),
                          BlocConsumer<AuthBloc, AuthState>(
                            listener: (context, state) {
                              if (state is PasswordResetFailure) {
                                AppHelpers.showSnackBar(context, state.message);
                              } else if (state is PasswordResetSuccess) {
                                AppHelpers.showSnackBar(
                                    backgroundColor: AppColors.success,
                                    context,
                                    'Password reset successful');
                              }
                            },
                            builder: (context, state) => ListTile(
                              onTap: () {
                                showAppSheet(
                                    context: context,
                                    title: 'Reset Password',
                                    child: ResetPassSheet(
                                      onDone: (oldPass, newPass) {
                                        context
                                            .read<AuthBloc>()
                                            .add(ResetPasswordEvent(
                                              currentPassword: oldPass,
                                              newPassword: newPass,
                                            ));
                                        Navigator.pop(context);
                                      },
                                    ));
                              },
                              contentPadding: const EdgeInsets.all(0),
                              title: Text('Reset Password',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: AppHelpers.isDarkMode(context)
                                        ? AppColors.white
                                        : AppColors.black,
                                  )),
                              subtitle:
                                  const Text('Reset your account password',
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
                          ),
                          ListTile(
                            onTap: () async {
                              await HapticFeedback.mediumImpact();
                              await showAppSheet(
                                  onSubmitPressed: () {},
                                  submitButtonRequired: true,
                                  submitButtonTitle: 'Delete',
                                  context: context,
                                  title: 'Delete Account',
                                  child: const DeleteAccountSheet());
                            },
                            contentPadding: const EdgeInsets.all(0),
                            title: const Text('Delete Account',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.error,
                                )),
                            subtitle: const Text('This action is irreversible.',
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
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          color: AppHelpers.isDarkMode(context)
              ? AppColors.secondaryDark
              : AppColors.white,
          height: 55,
          child: Column(
            children: <Widget>[
              Text('V $appVersion',
                  style: const TextStyle(fontSize: 16, color: AppColors.grey)),
            ],
          ),
        ),
      );
}
