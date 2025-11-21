import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'features/auth/auth_module.dart';
import 'features/bottom_navigation/bottom_nav_module.dart';
import 'features/flight_booking/flight_booking_module.dart';
import 'features/legal/legal_module.dart';
import 'features/notifiaction/notification_module.dart';
import 'features/payment/payment_module.dart';
import 'features/profile_management/profile_management_module.dart';
import 'features/sales/sales_module.dart';
import 'features/settings/settings_module.dart';
import 'features/splash/screens/app_updater.dart';
import 'features/splash/splash_module.dart';
import 'features/ticket/ticket_module.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: SplashModule.splashRoute,
    routes: <RouteBase>[
      //Splash
      GoRoute(
        path: SplashModule.splashRoute,
        name: SplashModule.spashName,
        builder: (BuildContext context, GoRouterState state) =>
            SplashModule.builder(),
      ),

      //Auth
      GoRoute(
        path: AuthModule.loginPath,
        name: AuthModule.loginName,
        builder: (BuildContext context, GoRouterState state) =>
            AuthModule.loginBuilder(),
      ),
      GoRoute(
        path: AuthModule.registerPath,
        name: AuthModule.registerName,
        builder: (BuildContext context, GoRouterState state) =>
            AuthModule.registerBuilder(),
      ),

      //bottom navigation
      GoRoute(
        path: BottomNavModule.path,
        name: BottomNavModule.name,
        builder: (BuildContext context, GoRouterState state) =>
            BottomNavModule.builder(),
      ),

      GoRoute(
          path: PaymentModule.paymentSucessPath,
          name: PaymentModule.paymentSucessName,
          builder: (BuildContext context, GoRouterState state) =>
              PaymentModule.paymentSuccessBuilder(context, state)),
      GoRoute(
        path: PaymentModule.paymentFailedPath,
        name: PaymentModule.paymentFailedName,
        builder: (BuildContext context, GoRouterState state) =>
            PaymentModule.paymentFailedBuilder(context, state),
      ),

      //ticket
      GoRoute(
        path: TicketModule.ticketsRoute,
        name: TicketModule.tickets,
        builder: (BuildContext context, GoRouterState state) =>
            TicketModule.ticketBuilder(),
      ),
      GoRoute(
        path: TicketModule.ticketDetailsRoute,
        name: TicketModule.ticketDetails,
        builder: (BuildContext context, GoRouterState state) =>
            TicketModule.ticketDetailsBuilder(state),
      ),

      //Flight Booking
      GoRoute(
        path: FlightBookingModule.flightSearchResult,
        name: FlightBookingModule.flightSearchResultName,
        builder: (BuildContext context, GoRouterState state) =>
            FlightBookingModule.searchBuilder(context, state),
      ),
      GoRoute(
        path: FlightBookingModule.seatSelection,
        name: FlightBookingModule.seatSelectionName,
        builder: (BuildContext context, GoRouterState state) =>
            FlightBookingModule.seatSelectionBuilder(),
      ),

      //sales
      GoRoute(
        path: SalesModule.myMarkupRoute,
        name: SalesModule.myMarkupScreen,
        builder: (context, state) => SalesModule.myMarkupBuilder(),
      ),

      // GoRoute(
      //   path: FlightBookingModule.paymentDetails,
      //   name: FlightBookingModule.paymentDetailsName,
      //   builder: (context, state) =>
      //       FlightBookingModule.paymentDetailsBuilder(context, state),
      // ),
      GoRoute(
        path: FlightBookingModule.passDownload,
        name: FlightBookingModule.passDownloadName,
        builder: (BuildContext context, GoRouterState state) =>
            FlightBookingModule.passDownloadBuilder(context, state),
      ),
      GoRoute(
        path: FlightBookingModule.airportSearch,
        name: FlightBookingModule.airportSearchName,
        builder: (BuildContext context, GoRouterState state) =>
            FlightBookingModule.airportSearchBuilder(context, state),
      ),
      // GoRoute(
      //   path: FlightBookingModule.passengerDetailsNew,
      //   name: FlightBookingModule.passengerDetailsNewName,
      //   builder: (context, state) =>
      //       FlightBookingModule.passengerDetailsNewBuilder(context, state),
      // ),
      GoRoute(
        path: FlightBookingModule.flightDetails,
        name: FlightBookingModule.flightDetailsName,
        builder: (BuildContext context, GoRouterState state) =>
            FlightBookingModule.flightDetailsBuilder(context, state),
      ),
      GoRoute(
        path: FlightBookingModule.bookingPolicy,
        name: FlightBookingModule.bookingPolicyName,
        builder: (BuildContext context, GoRouterState state) =>
            FlightBookingModule.bookingPolicyBuilder(),
      ),

      //Profile Management
      GoRoute(
        path: ProfileManagementModule.editProfilePath,
        name: ProfileManagementModule.editProfileName,
        builder: (BuildContext context, GoRouterState state) =>
            ProfileManagementModule.editProfileBuilder(context, state),
      ),
      GoRoute(
        path: ProfileManagementModule.citySeacrRoute,
        name: ProfileManagementModule.citySearchName,
        builder: (BuildContext context, GoRouterState state) =>
            ProfileManagementModule.citySearchBuilder(context, state),
      ),

      //legal
      GoRoute(
        path: LegalModule.termsRoute,
        name: LegalModule.termsName,
        builder: (BuildContext context, GoRouterState state) =>
            LegalModule.termsBuilder(),
      ),
      GoRoute(
        path: LegalModule.policyRoute,
        name: LegalModule.policyName,
        builder: (BuildContext context, GoRouterState state) =>
            LegalModule.policyBuilder(),
      ),
      //notification
      GoRoute(
        path: NotificationModule.routePath,
        name: NotificationModule.routeName,
        builder: (BuildContext context, GoRouterState state) =>
            NotificationModule.builder(),
      ),
      //settings
      GoRoute(
        path: SettingsModule.routePath,
        name: SettingsModule.routeName,
        builder: (BuildContext context, GoRouterState state) =>
            SettingsModule.builder(),
      ),

      //updator
      GoRoute(
          path: '/update',
          name: 'update',
          builder: (BuildContext context, GoRouterState state) {
            final Map<String, dynamic> data =
                state.extra as Map<String, dynamic>;
            final String url = data['url'];
            final String version = data['version'];
            return AppUpdaterScreen(
              downloadUrl: url,
              latestVersion: version,
            );
          })
    ],
    errorBuilder: (BuildContext context, GoRouterState state) => const Scaffold(
      body: Center(
        child: Text('Page not found!'),
      ),
    ),
  );
}
