import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/app_styles.dart';
import '../../../../core/utils/storage_service.dart';
import '../../../../core/widgets/app_exit_sheet.dart';
import '../../../../core/widgets/app_gradient_bg.dart';
import '../../../flight_booking/presentation/screens/flight_search_screen.dart';
import '../../../profile_management/bloc/profile_bloc.dart';
import '../../../profile_management/presentation/screens/my_profile_screen.dart';
import '../../../ticket/presentation/screens/ticket_screen.dart';
import '../../../wish_list/presentation/screens/wish_list_screen.dart';
import '../widgets/app_button_nav.dart';
import '../widgets/bottom_navigation_loading.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int _currentIndex = 0;
  bool isLoading = true;
  List<Widget> _screens = [];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      {
        String? accessToken = await StorageService.getAccessToken();
        if (context.mounted) {
          if (accessToken != null && accessToken.isNotEmpty) {
            if (context.mounted) {
              context
                  .read<ProfileBloc>()
                  .add(LoadProfileEvent(token: accessToken));
            }
          }
        }
        _screens = [
          const FlightSearchScreen(),
          TicketScreen(),
          const WishListScreen(),
          MyProfileScreen()
        ];
        setState(() {
          isLoading = false;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const BottomNavigationLoading()
        : PopScope(
            canPop: false,
            onPopInvokedWithResult: (didPop, result) async {
              log('didPop $didPop');
              log('pop result $result');
              if (!didPop) {
                if (_currentIndex == 0) {
                  await showAppExitSheet(context: context);
                }
                setState(() {
                  _currentIndex = 0;
                });
              }
            },
            child: Scaffold(
              body: AppGradientBg(
                child: SafeArea(child: _screens[_currentIndex]),
              ),
              bottomNavigationBar: AppButtonNav(
                currentIndex: _currentIndex,
                onTap: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
            ),
          );
  }
}
