import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_styles.dart';
import '../../../core/utils/storage_service.dart';
import '../../auth/auth_module.dart';
import '../../bottom_navigation/bottom_nav_module.dart';
import '../../profile_management/bloc/profile_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _handleAuthentication();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(),
        backgroundColor: AppColors.black,
        body: BlocConsumer<ProfileBloc, ProfileState>(
          listener: (BuildContext context, ProfileState state) async {
            if (state is ProfileError) {
              log("ProfileError");
              await StorageService.clearTokens();
              if (context.mounted) {
                context.goNamed(AuthModule.loginName);
              }
            }
            if (state is ProfileLoaded) {
              if (context.mounted) {
                context.goNamed(BottomNavModule.name);
              }
            }
          },
          builder: (BuildContext context, ProfileState state) => Center(
            child: Image.asset('assets/images/app_logo.png'),
          ),
        ),
      );

  // landle authentication
  Future<void> _handleAuthentication() async {
    try {
      final String? asscessToken = await StorageService.getAccessToken();
      final String? refreshToken = await StorageService.getRefreshToken();
      if ((asscessToken != null && asscessToken.isNotEmpty) &&
          (refreshToken != null && refreshToken.isNotEmpty)) {
        if (context.mounted) {
          context.read<ProfileBloc>().add(const LoadProfileEvent());
        }
        return;
      }
      if (context.mounted) {
        context.goNamed(AuthModule.loginName);
      }
      return;
    } catch (e) {
      log('Error: $e');
    }
  }
}
