import 'package:flutter/material.dart';
import 'presentation/screens/flight_search_result_screen.dart';
import 'presentation/screens/pasenger_details_screen.dart';
import 'presentation/screens/pass_download_screen.dart';
import 'presentation/screens/payment_details_screen.dart';
import 'presentation/screens/seat_selection_screen.dart';

class FlightBoolingModule {
  static const String searchroute = '/flight-search';
  static const String searchName = 'flightSearch';
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
}
