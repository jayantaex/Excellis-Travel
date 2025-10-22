import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'features/auth/auth_module.dart';
import 'features/bottom_navigation/bottom_nav_module.dart';
import 'features/flight_booking/flight_booling_module.dart';
import 'features/legal/legal_module.dart';
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
      //DEPRICATED
      GoRoute(
        path: '/profile',
        name: 'profile',
        builder: (context, state) => ProfileModule.route(),
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

      //Splash
      GoRoute(
        path: '/splash',
        name: 'splash',
        builder: (context, state) => const SplashScreen(),
      ),

      //Auth
      GoRoute(
        path: AuthModule.loginPath,
        name: AuthModule.loginName,
        builder: (context, state) => AuthModule.loginBuilder(),
      ),

      //bottom navigation
      GoRoute(
        path: BottomNavModule.path,
        name: BottomNavModule.name,
        builder: (context, state) => BottomNavModule.builder(),
      ),

      //wallet management
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

      //Wish list
      GoRoute(
        path: WishListModule.routePath,
        name: WishListModule.routeName,
        builder: (context, state) => WishListModule.builder(),
      ),

      //ticket
      GoRoute(
        path: TicketModule.routePath,
        name: TicketModule.routeName,
        builder: (context, state) => TicketModule.builder(),
      ),

      //Flight Booking
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

      //Profile Management
      GoRoute(
        path: ProfileManagementModule.editProfilePath,
        name: ProfileManagementModule.editProfileName,
        builder: (context, state) =>
            ProfileManagementModule.editProfileBuilder(),
      ),

      //legal
      GoRoute(
        path: LegalModule.termsRoute,
        name: LegalModule.termsName,
        builder: (context, state) => LegalModule.termsBuilder(),
      ),
      GoRoute(
        path: LegalModule.policyRoute,
        name: LegalModule.policyName,
        builder: (context, state) => LegalModule.policyBuilder(),
      ),
    ],
    errorBuilder: (context, state) => const Scaffold(
      body: Center(
        child: Text('Page not found!'),
      ),
    ),
  );
}
