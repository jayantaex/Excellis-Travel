import 'package:excellistravel/core/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_styles.dart';
import '../../../utils/app_toast.dart';
import '../../../utils/app_updater.dart';
import '../../../utils/storage_service.dart';
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
      final bool hasUpdate =
          AppConstants.env == 'development' ? await _handleAppUpdate() : false;
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
              _navigateToLogin();
            }
            if (state is ProfileLoaded) {
              _navigateToBottomNav();
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
        _fetchProfile();
        return;
      }
      _navigateToLogin();
      return;
    } catch (e) {
      showToast(message: 'Failed to authenticate');
    }
  }

  Future<bool> _handleAppUpdate() async {
    try {
      final bool isUpdateAvailable = await AppUpdater().isUpdateAvailable();
      final info = await AppUpdater().getLatestVersion();

      if (isUpdateAvailable) {
        _navigateToUpdate(url: info['url'], version: info['version']);
        return true; // Update is available
      }
      return false; // No update available
    } catch (e) {
      showToast(message: 'Failed to check for updates');
      return false; // On error, proceed with normal flow
    }
  }

  void _navigateToLogin() {
    context.goNamed(AuthModule.loginName);
  }

  void _navigateToBottomNav() {
    if (context.mounted) {
      context.goNamed(BottomNavModule.name);
    }
  }

  void _navigateToUpdate({required String url, required String version}) {
    if (context.mounted) {
      context.goNamed('update', extra: {'url': url, 'version': version});
    }
  }

  void _fetchProfile() {
    context.read<ProfileBloc>().add(const LoadProfileEvent());
  }
}
