import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/app_styles.dart';
import '../../../../core/utils/app_helpers.dart';
import '../../../../core/utils/app_toast.dart';
import '../../../../core/utils/storage_service.dart';
import '../../../../core/widgets/trans_white_bg_widget.dart';
import '../../../auth/auth_module.dart';
import '../../../legal/legal_module.dart';
import '../../../settings/settings_module.dart';
import '../../bloc/profile_bloc.dart';
import '../../profile_management_module.dart';
import '../widgets/log_out_sheet.dart';
import '../widgets/user_content_widget.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({super.key});
  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  final List<Map<String, String>> options = <Map<String, String>>[
    <String, String>{
      'title': 'Profile',
      'iconPath': '${AppConstants.assetIcontUrl}my_profile.svg',
      'routeName': ProfileManagementModule.editProfileName
    },
    <String, String>{
      'title': 'Terms & Conditions',
      'iconPath': '${AppConstants.assetIcontUrl}terms.svg',
      'routeName': LegalModule.termsName
    },
    <String, String>{
      'title': 'Privacy Policy',
      'iconPath': '${AppConstants.assetIcontUrl}privacy_policy.svg',
      'routeName': LegalModule.policyName
    },
    <String, String>{
      'title': 'Settings',
      'iconPath': '${AppConstants.assetIcontUrl}settings.svg',
      'routeName': SettingsModule.routeName
    },
    <String, String>{
      'title': 'Sign Out',
      'iconPath': '${AppConstants.assetIcontUrl}sign_out.svg',
      'routeName': ''
    }
  ];
   bool isLogedIn = false;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      isLogedIn = await isLogedInFun(); 
      if (context.mounted) {
        context.read<ProfileBloc>().add(const LoadProfileEvent());
      }
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: false,
          title: const Text(
            'Profile',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          actions: <Widget>[
            IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  '${AppConstants.assetIcontUrl}whatsapp.svg',
                  height: 31,
                  width: 31,
                ))
          ],
        ),
        body: TransWhiteBgWidget(
          child: BlocBuilder<ProfileBloc, ProfileState>(
            builder: (BuildContext context, ProfileState state) => Column(
              children: <Widget>[
                //profile components
                SizedBox(
                  width: AppHelpers.getScreenWidth(context),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      UserContentWidget(
                        userImage: '',
                        userName: state is ProfileLoaded
                            ? state.profileData.firstName ?? 'Guest'
                            : 'Guest',
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.light_mode,
                            color: AppColors.white,
                          ))
                    ],
                  ),
                ),

                //links
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(top: 25),
                    decoration: const BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      children: <Widget>[
                        const SizedBox(height: 20),
                        ...options.map((Map<String, String> option) => ListTile(
                            leading: SvgPicture.asset(
                              option['iconPath'] ?? '',
                              height: 17,
                              width: 17,
                            ),
                            title: Text(
                              option['title'] == 'Sign Out'
                                  ? isLogedIn
                                      ? 'Logout'
                                      : 'Login'
                                  : option['title'] ?? '',
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w400),
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
                                    message:
                                        'Please login to edit your profile');
                              }

                              if (option['routeName'] == 'settings') {
                                if (!isLogedIn) {
                                  showToast(
                                      message:
                                          'Please login to access settings');
                                  return;
                                }

                                if (context.mounted) {
                                  context.pushNamed(
                                    option['routeName'] ?? '',
                                  );
                                  return;
                                }
                              }

                              if (option['title'] == 'Sign Out') {
                        
                                if (isLogedIn) {
                                          log('${option['routeName']}');
                                log('${option['title']}');
                                  if (context.mounted) {
                                    await showLogoutSheet(context: context);
                                  }
                                  return;
                                }
                                if (context.mounted) {
                                  context.goNamed(AuthModule.loginName);
                                  return;
                                }
                              }

                              context.pushNamed(option['routeName'] ?? '');
                            }))
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );

  Future<bool> isLogedInFun() async {
    final String? token = await StorageService.getAccessToken();
    return token != null && token.isNotEmpty;
  }
}
