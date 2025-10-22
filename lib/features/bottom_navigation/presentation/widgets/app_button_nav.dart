import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:reiselab/core/constants/app_constants.dart';
import 'package:reiselab/core/constants/app_styles.dart';

class AppButtonNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  AppButtonNav({super.key, required this.currentIndex, required this.onTap});
  final List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(
      activeIcon: Container(
        padding: const EdgeInsets.all(8),
        width: 70,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.black.withOpacity(0.05),
                AppColors.transparent
              ]),
          border:
              const Border(top: BorderSide(color: AppColors.black, width: 2)),
        ),
        child: SvgPicture.asset(
          '${AppConstants.assetIcontUrl}home.svg',
          colorFilter: const ColorFilter.mode(AppColors.black, BlendMode.srcIn),
        ),
      ),
      icon: Container(
        padding: const EdgeInsets.all(8),
        width: 70,
        decoration: const BoxDecoration(
          border:
              Border(top: BorderSide(color: AppColors.transparent, width: 2)),
        ),
        child: SvgPicture.asset(
          '${AppConstants.assetIcontUrl}home.svg',
          colorFilter: const ColorFilter.mode(AppColors.grey, BlendMode.srcIn),
        ),
      ),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      activeIcon: Container(
        padding: const EdgeInsets.all(8),
        width: 70,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.black.withOpacity(0.05),
                AppColors.transparent
              ]),
          border:
              const Border(top: BorderSide(color: AppColors.black, width: 2)),
        ),
        child: SvgPicture.asset(
          '${AppConstants.assetIcontUrl}ticket.svg',
          colorFilter: const ColorFilter.mode(AppColors.black, BlendMode.srcIn),
        ),
      ),
      icon: Container(
        padding: const EdgeInsets.all(8),
        width: 70,
        decoration: const BoxDecoration(
          border:
              Border(top: BorderSide(color: AppColors.transparent, width: 2)),
        ),
        child: SvgPicture.asset(
          '${AppConstants.assetIcontUrl}ticket.svg',
          colorFilter: const ColorFilter.mode(AppColors.grey, BlendMode.srcIn),
        ),
      ),
      label: 'Ticket',
    ),
    BottomNavigationBarItem(
      activeIcon: Container(
        padding: const EdgeInsets.all(8),
        width: 70,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.black.withOpacity(0.05),
                AppColors.transparent
              ]),
          border:
              const Border(top: BorderSide(color: AppColors.black, width: 2)),
        ),
        child: SvgPicture.asset(
          '${AppConstants.assetIcontUrl}wish_list.svg',
          colorFilter: const ColorFilter.mode(AppColors.black, BlendMode.srcIn),
        ),
      ),
      icon: Container(
        padding: const EdgeInsets.all(8),
        width: 70,
        decoration: const BoxDecoration(
          border:
              Border(top: BorderSide(color: AppColors.transparent, width: 2)),
        ),
        child: SvgPicture.asset(
          '${AppConstants.assetIcontUrl}wish_list.svg',
          colorFilter: const ColorFilter.mode(AppColors.grey, BlendMode.srcIn),
        ),
      ),
      label: 'Wishlist',
    ),
    BottomNavigationBarItem(
      activeIcon: Container(
        padding: const EdgeInsets.all(8),
        width: 70,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.black.withOpacity(0.05),
                AppColors.transparent
              ]),
          border:
              const Border(top: BorderSide(color: AppColors.black, width: 2)),
        ),
        child: SvgPicture.asset(
          '${AppConstants.assetIcontUrl}profile.svg',
          colorFilter: const ColorFilter.mode(AppColors.black, BlendMode.srcIn),
        ),
      ),
      icon: Container(
        padding: const EdgeInsets.all(8),
        width: 70,
        decoration: const BoxDecoration(
          border:
              Border(top: BorderSide(color: AppColors.transparent, width: 2)),
        ),
        child: SvgPicture.asset(
          '${AppConstants.assetIcontUrl}profile.svg',
          colorFilter: const ColorFilter.mode(AppColors.grey, BlendMode.srcIn),
        ),
      ),
      label: 'Profile',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      enableFeedback: false,
      useLegacyColorScheme: false,
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: AppColors.grey,
      selectedItemColor: AppColors.black,
      selectedFontSize: 12,
      unselectedFontSize: 12,
      elevation: 0,
      currentIndex: currentIndex,
      onTap: onTap,
      items: items,
    );
  }
}
