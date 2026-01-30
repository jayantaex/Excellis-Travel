import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../utils/storage_service.dart';
import '../../../../core/widgets/app_exit_sheet.dart';
import '../../../../core/widgets/app_gradient_bg.dart';
import '../../../../core/widgets/app_sheet.dart';
import '../../../flight_booking/presentation/screens/flight_search_screen.dart';
import '../../../profile_management/bloc/profile_bloc.dart';
import '../../../profile_management/presentation/screens/my_profile_screen.dart';
import '../../../sales/presentation/screens/sales_screen.dart';
import '../../../booking/presentation/screens/my_booking_screen.dart';
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
  void _loadProfile() {
    context.read<ProfileBloc>().add(const LoadProfileEvent());
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      {
        final String? accessToken = await StorageService.getAccessToken();
        if (context.mounted) {
          if (accessToken != null && accessToken.isNotEmpty) {
            _loadProfile();
          }
        }
        _screens = const <Widget>[
          FlightSearchScreen(),
          MyBookingScreen(),
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
            if (!didPop) {
              if (_currentIndex == 0) {
                await showAppSheet(
                  onSubmitPressed: () async {
                    SystemNavigator.pop();
                  },
                  submitButtonRequired: true,
                  submitButtonTitle: 'Yes',
                  context: context,
                  title: 'Exit',
                  child: const AppExitSheet(),
                );
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
