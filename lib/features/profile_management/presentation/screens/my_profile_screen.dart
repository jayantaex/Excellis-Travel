import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/app_styles.dart';
import '../../../../core/services/local_db.dart';
import '../../../../core/widgets/app_sheet.dart';
import '../../../../utils/app_helpers.dart';
import '../../../../utils/app_toast.dart';
import '../../../../utils/storage_service.dart';
import '../../../../core/widgets/app_custom_appbar.dart';
import '../../../../core/widgets/trans_white_bg_widget.dart';
import '../../../auth/auth_module.dart';
import '../../../auth/presentation/widgets/log_out_sheet.dart';
import '../../../legal/legal_module.dart';
import '../../../sales/sales_module.dart';
import '../../../settings/settings_module.dart';
import '../../../wallet_management/wallet_module.dart';
import '../../bloc/profile_bloc.dart';
import '../../profile_management_module.dart';
import '../widgets/user_content_widget.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({super.key});
  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

LocalDB _localDB = LocalDB();

class _MyProfileScreenState extends State<MyProfileScreen> {
  final List<Map<String, String>> options = <Map<String, String>>[
    <String, String>{
      'title': 'Profile',
      'iconPath': '${AppConstants.assetIcontUrl}profile.svg',
      'routeName': ProfileManagementModule.editProfileName
    },
    <String, String>{
      'title': 'My Markup',
      'iconPath': '${AppConstants.assetIcontUrl}markup.svg',
      'routeName': ''
    },
    <String, String>{
      'title': 'My Wallet',
      'iconPath': '${AppConstants.assetIcontUrl}wallet.svg',
      'routeName': WalletModule.wallet
    },
    <String, String>{
      'title': 'Credit Wallet',
      'iconPath': '${AppConstants.assetIcontUrl}credit_wallet.svg',
      'routeName': WalletModule.creditWallet
    },
    <String, String>{
      'title': 'Withdrawl Request',
      'iconPath': '${AppConstants.assetIcontUrl}withdrawl_request.svg',
      'routeName': WalletModule.withdrawlRequest
    },
    <String, String>{
      'title': 'Terms & Conditions',
      'iconPath': '${AppConstants.assetIcontUrl}terms.svg',
      'routeName': LegalModule.termsName
    },
    <String, String>{
      'title': 'Privacy Policy',
      'iconPath': '${AppConstants.assetIcontUrl}policy.svg',
      'routeName': LegalModule.policyName
    },
    <String, String>{
      'title': 'Settings',
      'iconPath': '${AppConstants.assetIcontUrl}settings.svg',
      'routeName': SettingsModule.routeName
    },
    <String, String>{
      'title': 'Sign Out',
      'iconPath': '${AppConstants.assetIcontUrl}logout.svg',
      'routeName': ''
    }
  ];
  bool isLogedIn = false;

  void _loadProfile() {
    context.read<ProfileBloc>().add(const LoadProfileEvent());
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      isLogedIn = await isLogedInFun();
      if (context.mounted) {
        _loadProfile();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isDark = AppHelpers.isDarkMode(context);
    return TransWhiteBgWidget(
      child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (BuildContext context, ProfileState state) => Column(
          children: <Widget>[
            const AppCustomAppbar(
              isBackButtonRequired: false,
              centerTitle: 'My Profile',
            ),
            //profile components
            SizedBox(
              width: AppHelpers.getScreenWidth(context),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  UserContentWidget(
                    userImage: '',
                    userName: state is ProfileLoaded
                        ? '${state.profileData.firstName ?? ''} ${state.profileData.lastName ?? ''}'
                        : 'Guest',
                  ),
                ],
              ),
            ),

            //links
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 25),
                decoration: BoxDecoration(
                  color: isDark ? AppColors.secondaryDark : AppColors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 20),
                    ...options.map(
                      (Map<String, String> option) => ListTile(
                        trailing: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: isDark ? AppColors.white : AppColors.primary,
                          size: 12,
                        ),
                        leading: SvgPicture.asset(
                          option['iconPath'] ?? '',
                          height: 20,
                          width: 20,
                          colorFilter: ColorFilter.mode(
                              isDark ? AppColors.white : AppColors.primary,
                              BlendMode.srcIn),
                        ),
                        title: Text(
                          option['title'] == 'Sign Out'
                              ? isLogedIn
                                  ? 'Logout'
                                  : 'Login'
                              : option['title'] ?? '',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color:
                                  isDark ? AppColors.white : AppColors.black),
                        ),
                        onTap: () async {
                          if (option['routeName'] == 'edit_profile') {
                            if (isLogedIn) {
                              if (context.mounted) {
                                context.pushNamed(
                                  option['routeName'] ?? '',
                                  extra: context.read<ProfileBloc>(),
                                );
                              }
                              return;
                            }
                            showToast(
                                message: 'Please login to edit your profile');
                            return;
                          }

                          if (option['routeName'] == SettingsModule.routeName) {
                            if (!isLogedIn) {
                              showToast(
                                  message: 'Please login to access settings');
                              return;
                            }

                            if (context.mounted) {
                              context.pushNamed(
                                option['routeName'] ?? '',
                              );
                              return;
                            }
                          }
                          if (option['routeName'] == WalletModule.wallet) {
                            if (!isLogedIn) {
                              showToast(
                                  message: 'Please login to access wallet');
                              return;
                            }

                            if (context.mounted) {
                              context.pushNamed(
                                option['routeName'] ?? '',
                              );
                              return;
                            }
                          }
                          if (option['routeName'] ==
                              WalletModule.creditWallet) {
                            if (!isLogedIn) {
                              showToast(
                                  message: 'Please login to access wallet');
                              return;
                            }

                            if (context.mounted) {
                              context.pushNamed(
                                option['routeName'] ?? '',
                              );
                              return;
                            }
                          }

                          if (option['routeName'] ==
                              SalesModule.myMarkupScreen) {
                            if (isLogedIn) {
                              if (context.mounted) {
                                context.pushNamed(SalesModule.myMarkupScreen);
                              }
                              return;
                            }
                            showToast(message: 'Please login to access markup');
                            return;
                          }

                          if (option['title'] == 'Sign Out') {
                            if (isLogedIn) {
                              if (context.mounted) {
                                await showAppSheet(
                                  context: context,
                                  title: 'Logout',
                                  child: const LogOutSheet(),
                                  submitButtonRequired: true,
                                  submitButtonTitle: 'Logout',
                                  onSubmitPressed: () async {
                                    await StorageService.clearTokens();
                                    await _localDB.clearAllLocalDB();
                                    context.mounted
                                        ? context.goNamed(AuthModule.loginName)
                                        : null;
                                  },
                                );
                              }
                              return;
                            }
                            if (context.mounted) {
                              context.goNamed(AuthModule.loginName);
                              return;
                            }
                          }

                          context.pushNamed(option['routeName'] ?? '');
                        },
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<bool> isLogedInFun() async {
    final String? token = await StorageService.getAccessToken();
    return token != null && token.isNotEmpty;
  }
}
