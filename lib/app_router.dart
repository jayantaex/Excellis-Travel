import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'features/auth/auth_module.dart';
import 'features/bottom_navigation/bottom_nav_module.dart';
import 'features/flight_booking/flight_booling_module.dart';
import 'features/profile/profile_module.dart';
import 'features/profile_management/profile_management_module.dart';
import 'features/splash/screens/splash_screen.dart';
import 'features/ticket/ticket_module.dart';
import 'features/todo/todo_module.dart';
import 'features/wallet_management/presentation/screens/wallet_payment_failed_screen.dart';
import 'features/wallet_management/presentation/screens/wallet_payment_success_screen.dart';
import 'features/wallet_management/wallet_module.dart';
import 'features/wish_list/wish_list_module.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/splash',
    routes: [
      GoRoute(
        path: '/splash',
        name: 'splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: AuthModule.loginPath,
        name: AuthModule.loginName,
        builder: (context, state) => AuthModule.loginBuilder(),
      ),
      GoRoute(
        path: AuthModule.registerPath,
        name: AuthModule.registerName,
        builder: (context, state) => AuthModule.registerBuilder(),
      ),
      GoRoute(
        path: '/profile',
        name: 'profile',
        builder: (context, state) => ProfileModule.route(),
      ),
      GoRoute(
        path: BottomNavModule.path,
        name: BottomNavModule.name,
        builder: (context, state) => BottomNavModule.builder(),
      ),
      GoRoute(
        path: TodoModule.addTodoPath,
        name: TodoModule.addTodoName,
        builder: (context, state) => TodoModule.addTodoBuilder(
          userId: state.pathParameters != null
              ? int.parse(state.pathParameters['userId']!)
              : 0,
        ),
      ),
      GoRoute(
        path: WalletModule.myWalletPath,
        name: WalletModule.myWalletName,
        builder: (context, state) => WalletModule.myWalletBuilder(),
      ),
      GoRoute(
        path: WalletModule.paymentSucessPath,
        name: WalletModule.paymentSucessName,
        builder: (context, state) => WalletPaymentSuccessScreen(
          paymentId: state.pathParameters['paymentId'] ?? '',
        ),
      ),
      GoRoute(
        path: WalletModule.paymentFailedPath,
        name: WalletModule.paymentFailedName,
        builder: (context, state) => WalletPaymentFailedScreen(
          errMsg: state.pathParameters['errorMsg'] ?? '',
        ),
      ),
      GoRoute(
        path: WishListModule.routePath,
        name: WishListModule.routeName,
        builder: (context, state) => WishListModule.builder(),
      ),
      GoRoute(
        path: TicketModule.routePath,
        name: TicketModule.routeName,
        builder: (context, state) => TicketModule.builder(),
      ),
      GoRoute(
        path: FlightBoolingModule.searchResult,
        name: FlightBoolingModule.searchName,
        builder: (context, state) => FlightBoolingModule.searchBuilder(),
      ),
      GoRoute(
        path: FlightBoolingModule.seatSelection,
        name: FlightBoolingModule.seatSelectionName,
        builder: (context, state) => FlightBoolingModule.seatSelectionBuilder(),
      ),
      GoRoute(
        path: FlightBoolingModule.passengerDetails,
        name: FlightBoolingModule.passengerDetailsName,
        builder: (context, state) =>
            FlightBoolingModule.passengerDetailsBuilder(),
      ),
      GoRoute(
        path: FlightBoolingModule.paymentDetails,
        name: FlightBoolingModule.paymentDetailsName,
        builder: (context, state) =>
            FlightBoolingModule.paymentDetailsBuilder(),
      ),
      GoRoute(
        path: FlightBoolingModule.passDownload,
        name: FlightBoolingModule.passDownloadName,
        builder: (context, state) => FlightBoolingModule.passDownloadBuilder(),
      ),
      GoRoute(
        path: ProfileManagementModule.editProfilePath,
        name: ProfileManagementModule.editProfileName,
        builder: (context, state) =>
            ProfileManagementModule.editProfileBuilder(),
      )
    ],
    errorBuilder: (context, state) => const Scaffold(
      body: Center(
        child: Text('Page not found!'),
      ),
    ),
  );
}
