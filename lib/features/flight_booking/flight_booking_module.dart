import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/network/amadeus_client.dart';
import '../../core/network/api_client.dart';
import '../profile_management/apis/profile_management_api.dart';
import '../profile_management/bloc/profile_bloc.dart';
import '../profile_management/data/profile_management_repository.dart';
import 'api/flight_booking_api.dart';
import 'bloc/flight_bloc.dart';
import 'data/flight_booking_repository.dart';
import 'models/air_port_model.dart';
import 'models/payment_verify_res_model.dart';
import 'presentation/screens/airport_search_screen.dart';
import 'presentation/screens/booking_policy.dart';
import 'presentation/screens/flight_details.dart';
import 'presentation/screens/flight_search_result_screen.dart';
import 'presentation/screens/pass_download_screen.dart';
import 'presentation/screens/payment_details_screen.dart';
import 'presentation/screens/seat_selection_screen.dart';

class FlightBookingModule {
  static final AmadeusClient _amadeusClient = AmadeusClient();
  static final _apiClient = ApiClient();
  static final _remoteSrc =
      FlightBookingApi(_amadeusClient, apiClient: _apiClient);
  static final _repository = FlightBookingRepository(api: _remoteSrc);
  static final _profileApi = ProfileManagementApi(apiClient: _apiClient);
  static final _profileRepo =
      ProfileManagementRepository(profileManagementApi: _profileApi);

  //airport search
  static const String airportSearch = '/airport-search';
  static const String airportSearchName = 'airportSearch';
  static Widget airportSearchBuilder(context, state) {
    // PaymentVerifiedModel _data = PaymentVerifiedModel.fromJson(bookedData);
    // return PassDownloadScreen(
    //   data: _data,
    // );

    final extra = state.extra as Map<String, dynamic>?;
    final onAirportSelected =
        extra?['onAirportSelected'] as void Function(AirportModel airport)?;

    final airportType = extra?['type'] as String?;
    final selectedAirport = extra?['selectedAirport'] as String?;

    return BlocProvider(
      create: (context) => FlightBloc(repository: _repository),
      child: AirportSearchScreen(
        type: airportType,
        selectedAirport: selectedAirport,
        onAirportSelected: onAirportSelected,
      ),
    );
  }

  // search -result
  static const String flightSearchResult = '/search-result';
  static const String flightSearchResultName = 'flightSearchResult';
  static Widget searchBuilder(context, state) {
    final extra = state.extra as Map<String, dynamic>?;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FlightBloc(repository: _repository),
        ),
      ],
      child: FlightSearchResultScreen(data: extra ?? {}),
    );
  }

  //seat selection
  static const String seatSelection = '/seat-selection';
  static const String seatSelectionName = 'seatSelection';
  static Widget seatSelectionBuilder() => const SeatSelection();

  // // passenger details
  // static const String passengerDetails = '/passenger-details';
  // static const String passengerDetailsName = 'passengerDetails';
  // static Widget passengerDetailsBuilder() => const PasengerDetailsScreen();

  //payment details
  static const String paymentDetails = '/payment-details';
  static const String paymentDetailsName = 'paymentDetails';
  static Widget paymentDetailsBuilder(context, state) {
    final extra = state.extra;
    return BlocProvider(
      create: (context) => FlightBloc(repository: _repository),
      child: PaymentDetailsScreen(
        data: extra['data'],
        selectedPlan: extra['selectedPlan'],
      ),
    );
  }

  //pass download
  static const String passDownload = '/pass-download';
  static const String passDownloadName = 'passDownload';
  static Widget passDownloadBuilder(contex, state) {
    PaymentVerifiedModel data = state.extra['data'];
    return PassDownloadScreen(data: data);
  }

  //flight Details
  static const String flightDetails = '/flight-details';
  static const String flightDetailsName = 'flightDetails';
  static Widget flightDetailsBuilder(context, state) {
    final extra = state.extra;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FlightBloc(repository: _repository),
        ),
        BlocProvider(
          create: (context) => ProfileBloc(profileRepository: _profileRepo),
        ),
      ],
      child: FlightDetailsScreen(
        flightDictionary: extra['flightDictionary'] ?? {},
        data: extra['data'] ?? {},
      ),
    );
  }

  //booking policy
  static const String bookingPolicy = '/booking-policy';
  static const String bookingPolicyName = 'bookingPolicy';
  static Widget bookingPolicyBuilder() => const BookingPolicy();
}
