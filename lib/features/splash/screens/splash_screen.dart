import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_styles.dart';
import '../../../core/utils/app_updater.dart';
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
      final bool hasUpdate = await _handleAppUpdate();
      // Only proceed with authentication if no update is available
      if (!hasUpdate) {
        await _handleAuthentication();
      }
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
        bottomNavigationBar: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Checking app version...',
            textAlign: TextAlign.center,
            style:
                TextStyle(color: AppColors.white, fontWeight: FontWeight.w400),
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

  Future<bool> _handleAppUpdate() async {
    try {
      final bool isUpdateAvailable = await AppUpdater().isUpdateAvailable();
      final info = await AppUpdater().getLatestVersion();

      if (isUpdateAvailable) {
        if (context.mounted) {
          context.goNamed('update',
              extra: {'url': info['url'], 'version': info['version']});
        }
        return true; // Update is available
      }
      return false; // No update available
    } catch (e) {
      log('Error: $e');
      return false; // On error, proceed with normal flow
    }
  }
}
