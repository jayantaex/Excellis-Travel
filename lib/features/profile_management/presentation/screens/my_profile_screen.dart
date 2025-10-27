import 'dart:developer';

import 'package:excellistravel/core/utils/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/app_styles.dart';
import '../../../../core/utils/app_helpers.dart';
import '../../../../core/widgets/trans_white_bg_widget.dart';
import '../../../auth/auth_module.dart';
import '../../../legal/legal_module.dart';
import '../../../settings/settings_module.dart';
import '../../bloc/profile_bloc.dart';
import '../../profile_management_module.dart';
import '../widgets/log_out_sheet.dart';
import '../widgets/user_content_widget.dart';

class MyProfileScreen extends StatelessWidget {
  MyProfileScreen({super.key});

  final List<Map<String, dynamic>> options = [
    {
      'title': 'Profile',
      'iconPath': '${AppConstants.assetIcontUrl}my_profile.svg',
      'routeName': ProfileManagementModule.editProfileName
    },
    {
      'title': 'Terms & Conditions',
      'iconPath': '${AppConstants.assetIcontUrl}terms.svg',
      'routeName': LegalModule.termsName
    },
    {
      'title': 'Privacy Policy',
      'iconPath': '${AppConstants.assetIcontUrl}privacy_policy.svg',
      'routeName': LegalModule.policyName
    },
    {
      'title': 'Settings',
      'iconPath': '${AppConstants.assetIcontUrl}settings.svg',
      'routeName': SettingsModule.routeName
    },
    {
      'title': 'Sign Out',
      'iconPath': '${AppConstants.assetIcontUrl}sign_out.svg',
      'routeName': ''
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.transparent,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: AppColors.transparent,
        title: const Text(
          'Profile',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        actions: [
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
        child: BlocConsumer<ProfileBloc, ProfileState>(
          listener: (context, state) {},
          builder: (context, state) {
            log('Profile states :::: $state');

            if (state is ProfileInitial) {
              options.removeLast();
            }
            return Column(
              children: [
                //profile components
                SizedBox(
                  width: AppHelpers.getScreenWidth(context),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      UserContentWidget(
                        userImage: '${AppConstants.assetImageUrl}user.jpg',
                        userName: state is ProfileLoaded
                            ? state.profileData.firstName ?? 'No-Name'
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
                      children: [
                        const SizedBox(height: 20),
                        ...options.map(
                          (option) => ListTile(
                            leading: SvgPicture.asset(
                              option['iconPath'],
                              height: 17,
                              width: 17,
                            ),
                            title: Text(
                              option['title'],
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w400),
                            ),
                            onTap: () async {
                              if (option['routeName'] == '' &&
                                  option['title'] == 'Sign Out') {
                                showLogoutSheet(context: context);
                              }
                              if (option['routeName'] != '') {
                                if (state is ProfileInitial) {
                                  if (option['title'] == 'Terms & Conditions' ||
                                      option['title'] == 'Privacy Policy') {
                                    context.pushNamed(option['routeName']);
                                  } else {
                                    context.pushNamed(AuthModule.loginName);
                                  }
                                }
                              }
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
