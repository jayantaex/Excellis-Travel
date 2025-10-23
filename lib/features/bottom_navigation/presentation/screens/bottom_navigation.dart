import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_styles.dart';
import '../../../../core/utils/app_helpers.dart';
import '../../../flight_booking/presentation/screens/flight_search_screen.dart';
import '../../../profile/bloc/profile_bloc.dart';
import '../../../profile/bloc/profile_event.dart';
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
  bool isLoading = false;
  final List<Widget> _screens = [
    const FlightSearchScreen(),
    TicketScreen(),
    WishListScreen(),
    MyProfileScreen()
  ];

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 0), () {
      if (context.mounted) context.read<ProfileBloc>().add(FetchProfile());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? BottomNavigationLoading()
        : Scaffold(
            backgroundColor: AppColors.primary,
            body: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [AppColors.primary, AppColors.secondary]),
                borderRadius: BorderRadiusDirectional.only(
                  topStart: Radius.circular(18),
                  topEnd: Radius.circular(18),
                ),
              ),
              height: AppHelpers.percenHeight(context: context),
              width: AppHelpers.percenWidth(context: context),
              child: _screens[_currentIndex],
            ),
            bottomNavigationBar: AppButtonNav(
              currentIndex: _currentIndex,
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          );
  }
}
