import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:in_app_update/in_app_update.dart';
import '../../../core/constants/app_styles.dart';
import '../../../core/services/app_update_service.dart';
import '../../../utils/app_toast.dart';
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
  final AppUpdateService _appUpdateService = AppUpdateService();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _checkForUpdate();
      await _handleAuthentication();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
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
            'Loading...',
            textAlign: TextAlign.center,
            style:
                TextStyle(color: AppColors.white, fontWeight: FontWeight.w400),
          ),
        ),
      );

  // landle authentication
  Future<void> _handleAuthentication() async {
    try {
      final String? accessToken = await StorageService.getAccessToken();
      final String? refreshToken = await StorageService.getRefreshToken();
      if ((accessToken != null && accessToken.isNotEmpty) &&
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

  void _navigateToLogin() {
    context.goNamed(AuthModule.loginName);
  }

  void _navigateToBottomNav() {
    if (context.mounted) {
      context.goNamed(BottomNavModule.name);
    }
  }

  void _fetchProfile() {
    context.read<ProfileBloc>().add(const LoadProfileEvent());
  }

  Future<void> _checkForUpdate() async {
    try {
      final AppUpdateInfo updateInfo = await _appUpdateService.checkForUpdate();
      if (updateInfo.updateAvailability == UpdateAvailability.updateAvailable) {
        await _appUpdateService.immidiateUpdate();
        return;
      }
      print('No update available');
    } catch (e) {
      // showToast(message: 'Failed to check for update');
    }
  }
}
