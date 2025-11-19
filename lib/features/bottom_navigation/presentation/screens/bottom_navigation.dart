import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/storage_service.dart';
import '../../../../core/widgets/app_exit_sheet.dart';
import '../../../../core/widgets/app_gradient_bg.dart';
import '../../../flight_booking/presentation/screens/flight_search_screen.dart';
import '../../../profile_management/bloc/profile_bloc.dart';
import '../../../profile_management/presentation/screens/my_profile_screen.dart';
import '../../../sales/presentation/screens/sales_screen.dart';
import '../../../ticket/presentation/screens/ticket_screen.dart';
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

  List<Widget> _screens = <Widget>[];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      {
        final String? accessToken = await StorageService.getAccessToken();
        if (context.mounted) {
          if (accessToken != null && accessToken.isNotEmpty) {
            if (context.mounted) {
              context.read<ProfileBloc>().add(const LoadProfileEvent());
            }
          }
        }
        _screens = const <Widget>[
          FlightSearchScreen(),
          TicketScreen(),
          SalesScreen(),
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
  Widget build(BuildContext context) => isLoading
      ? const BottomNavigationLoading()
      : PopScope(
          canPop: false,
          onPopInvokedWithResult: (bool didPop, Object? result) async {
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
              onTap: (int index) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),
        );
}
