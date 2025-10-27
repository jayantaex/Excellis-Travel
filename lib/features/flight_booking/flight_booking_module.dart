import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/network/api_client.dart';
import 'bloc/flight_bloc.dart';
import 'data/flight_booking_repository.dart';
import 'models/air_port_model.dart';
import 'presentation/screens/airport_search_screen.dart';
import 'presentation/screens/flight_details.dart';
import 'presentation/screens/flight_search_result_screen.dart';
import 'presentation/screens/pasenger_details_screen.dart';
import 'presentation/screens/pass_download_screen.dart';
import 'presentation/screens/payment_details_screen.dart';
import 'presentation/screens/seat_selection_screen.dart';
import 'src/flight_booking_remote_data_src.dart';

class FlightBookingModule {
  static const String searchroute = '/flight-search';
  static const String searchName = 'flightSearch';

  //airport search
  static const String airportSearch = '/airport-search';
  static const String airportSearchName = 'airportSearch';
  static Widget airportSearchBuilder(context, state) {
    final extra = state.extra as Map<String, dynamic>?;

    final onAirportSelected =
        extra?['onAirportSelected'] as void Function(AirportModel airport)?;

    final airportType = extra?['type'] as String?;
    final selectedAirport = extra?['selectedAirport'] as String?;

    final apiClient = ApiClient();
    final remoteSrc = FlightBookingRemoteDataSrc(
      apiClient: apiClient,
    );
    final repository = FlightBookingRepository(remoteSc: remoteSrc);

    return BlocProvider(
      create: (context) => FlightBloc(
        repository: repository,
      ),
      child: AirportSearchScreen(
        type: airportType,
        selectedAirport: selectedAirport,
        onAirportSelected: onAirportSelected,
      ),
    );
  }

  // search -result
  static const String searchResult = '/search-result';
  static const String searchResultName = 'flightSearchResult';
  static Widget searchBuilder() => const FlightSearchResultScreen();

  //seata selection
  static const String seatSelection = '/seat-selection';
  static const String seatSelectionName = 'seatSelection';
  static Widget seatSelectionBuilder() => const SeatSelection();

  // passenger details
  static const String passengerDetails = '/passenger-details';
  static const String passengerDetailsName = 'passengerDetails';
  static Widget passengerDetailsBuilder() => const PasengerDetailsScreen();

  //payment details
  static const String paymentDetails = '/payment-details';
  static const String paymentDetailsName = 'paymentDetails';
  static Widget paymentDetailsBuilder() => PaymentDetailsScreen();

  //pass download
  static const String passDownload = '/pass-download';
  static const String passDownloadName = 'passDownload';
  static Widget passDownloadBuilder() => const PassDownloadScreen();

  //flight Details
  static const String flightDetails = '/flight-details';
  static const String flightDetailsName = 'flightDetails';
  static Widget flightDetailsBuilder() =>  const FlightDetailsScreen();

  //passenger Details new
  static const String passengerDetailsNew = '/passenger-details-new';
  static const String passengerDetailsNewName = 'passengerDetailsNew';
  static Widget passengerDetailsNewBuilder() => const PasengerDetailsScreen();
}
