import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'features/auth/auth_module.dart';
import 'features/bottom_navigation/bottom_nav_module.dart';
import 'features/flight_booking/flight_booking_module.dart';
import 'features/legal/legal_module.dart';
import 'features/notifiaction/notification_module.dart';
import 'features/profile_management/profile_management_module.dart';
import 'features/settings/settings_module.dart';
import 'features/splash/screens/splash_screen.dart';
import 'features/splash/splash_module.dart';
import 'features/ticket/ticket_module.dart';

import 'features/wallet_management/presentation/screens/wallet_payment_failed_screen.dart';
import 'features/wallet_management/presentation/screens/wallet_payment_success_screen.dart';
import 'features/wallet_management/wallet_module.dart';
import 'features/wish_list/wish_list_module.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: SplashModule.splashRoute,
    routes: [
      //Splash
      GoRoute(
        path: SplashModule.splashRoute,
        name: SplashModule.spashName,
        builder: (context, state) => const SplashScreen(),
      ),

      //Auth
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
        path: TicketModule.ticketsRoute,
        name: TicketModule.tickets,
        builder: (context, state) => TicketModule.ticketBuilder(),
      ),
      GoRoute(
        path: TicketModule.ticketDetailsRoute,
        name: TicketModule.ticketDetails,
        builder: (context, state) => TicketModule.ticketDetailsBuilder(state),
      ),

      //Flight Booking
      GoRoute(
        path: FlightBookingModule.searchResult,
        name: FlightBookingModule.searchName,
        builder: (context, state) => FlightBookingModule.searchBuilder(),
      ),
      GoRoute(
        path: FlightBookingModule.seatSelection,
        name: FlightBookingModule.seatSelectionName,
        builder: (context, state) => FlightBookingModule.seatSelectionBuilder(),
      ),
      GoRoute(
        path: FlightBookingModule.passengerDetails,
        name: FlightBookingModule.passengerDetailsName,
        builder: (context, state) =>
            FlightBookingModule.passengerDetailsBuilder(),
      ),
      GoRoute(
        path: FlightBookingModule.paymentDetails,
        name: FlightBookingModule.paymentDetailsName,
        builder: (context, state) =>
            FlightBookingModule.paymentDetailsBuilder(),
      ),
      GoRoute(
        path: FlightBookingModule.passDownload,
        name: FlightBookingModule.passDownloadName,
        builder: (context, state) => FlightBookingModule.passDownloadBuilder(),
      ),
      GoRoute(
        path: FlightBookingModule.airportSearch,
        name: FlightBookingModule.airportSearchName,
        builder: (context, state) =>
            FlightBookingModule.airportSearchBuilder(context, state),
      ),
      GoRoute(
        path: FlightBookingModule.passengerDetailsNew,
        name: FlightBookingModule.passengerDetailsNewName,
        builder: (context, state) =>
            FlightBookingModule.passengerDetailsNewBuilder(),
      ),
      GoRoute(
        path: FlightBookingModule.flightDetails,
        name: FlightBookingModule.flightDetailsName,
        builder: (context, state) => FlightBookingModule.flightDetailsBuilder(),
      ),
      GoRoute(
        path: FlightBookingModule.bookingPolicy,
        name: FlightBookingModule.bookingPolicyName,
        builder: (context, state) => FlightBookingModule.bookingPolicyBuilder(),
      ),

      //Profile Management
      GoRoute(
        path: ProfileManagementModule.editProfilePath,
        name: ProfileManagementModule.editProfileName,
        builder: (context, state) =>
            ProfileManagementModule.editProfileBuilder(),
      ),
      GoRoute(
        path: ProfileManagementModule.citySeacrRoute,
        name: ProfileManagementModule.citySearchName,
        builder: (context, state) =>
            ProfileManagementModule.citySearchBuilder(context, state),
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
      //notification
      GoRoute(
        path: NotificationModule.routePath,
        name: NotificationModule.routeName,
        builder: (context, state) => NotificationModule.builder(),
      ),
      //settings
      GoRoute(
        path: SettingsModule.routePath,
        name: SettingsModule.routeName,
        builder: (context, state) => SettingsModule.builder(),
      ),
    ],
    errorBuilder: (context, state) => const Scaffold(
      body: Center(
        child: Text('Page not found!'),
      ),
    ),
  );
}
