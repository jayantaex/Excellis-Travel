import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../core/common/api/location_api.dart';
import '../../core/common/bloc/cities/city_bloc.dart';
import '../../core/common/bloc/states/states_bloc.dart';
import '../../core/common/data/location_repository.dart';
import '../../core/network/amadeus_client.dart';
import '../../core/network/api_client.dart';
import '../../core/services/local_db.dart';
import '../profile_management/bloc/profile_bloc.dart';
import '../profile_management/data/data_source/profile_management_remote_src.dart';
import '../profile_management/data/repository/profile_management_repository.dart';
import '../wallet_management/bloc/wallet_bloc.dart';
import '../wallet_management/data/repository/wallet_repository.dart';
import '../wallet_management/data/src/wallet_remote_data_src.dart';
import 'bloc/flight_bloc.dart';
import 'bloc/travleler_bloc/traveller_bloc.dart';
import 'data/data_source/flight_booking_local_src.dart';
import 'data/data_source/flight_booking_remote_src.dart';
import 'data/repository/flight_booking_repository.dart';
import 'data/models/air_port_model.dart';
import 'data/models/payment_verify_res_model.dart';
import 'presentation/screens/airport_search_screen.dart';
import 'presentation/screens/booking_policy.dart';
import 'presentation/screens/flight_details_screen.dart';
import 'presentation/screens/flight_list_screen.dart';
import 'presentation/screens/pass_download_screen.dart';
import 'presentation/screens/seat_map_screen.dart';

class FlightBookingModule {
  static final AmadeusClient _amadeusClient = AmadeusClient();
  static final ApiClient _apiClient = ApiClient();
  static final LocalDB _localDB = LocalDB();
  static final FlightBookingRemoteSrc _flightBookingRemoteSrc =
      FlightBookingRemoteSrc(_amadeusClient, apiClient: _apiClient);
  static final FlightBookingLocalSrc _flightBookingLocalSrc =
      FlightBookingLocalSrc(localDB: _localDB);
  static final FlightBookingRepository _flightBookingRepository =
      FlightBookingRepository(
          remoteSrc: _flightBookingRemoteSrc, localSrc: _flightBookingLocalSrc);
  static final _profileApi = ProfileManagementRemoteSrc(apiClient: _apiClient);
  static final _profileRepo =
      ProfileManagementRepository(profileManagementRemoteSrc: _profileApi);
  static final _statesRepository =
      LocationRepository(statesApi: LocationApi(apiClient: _apiClient));

  //airport search
  static const String airportSearch = '/airport-search';
  static const String airportSearchName = 'airportSearch';
  static Widget airportSearchBuilder(BuildContext context, state) {
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
      create: (context) => FlightBloc(repository: _flightBookingRepository),
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
  static Widget searchBuilder(BuildContext context, GoRouterState state) {
    final extra = state.extra as Map<String, dynamic>?;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FlightBloc(repository: _flightBookingRepository),
        ),
      ],
      child: FlightListScreen(data: extra ?? {}),
    );
  }

  //seat selection
  static const String seatSelection = '/seat-selection';
  static const String seatSelectionName = 'seatSelection';
  static Widget seatSelectionBuilder(BuildContext context, state) {
    final extra = state.extra;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FlightBloc(repository: _flightBookingRepository),
        ),
      ],
      child: SeatMapScreen(
        flightOffer: extra['flightOffer'],
        departureAirport: extra['departureAirport'],
        arivalAirport: extra['arivalAirport'],
      ),
    );
  }

  //pass download
  static const String passDownload = '/pass-download';
  static const String passDownloadName = 'passDownload';
  static Widget passDownloadBuilder(BuildContext contex, state) {
    final PaymentVarifiedDataModel data = state.extra['data'];
    return PassDownloadScreen(data: data);
  }

  //flight Details
  static const String flightDetails = '/flight-details';
  static const String flightDetailsName = 'flightDetails';
  static Widget flightDetailsBuilder(BuildContext context, state) {
    final extra = state.extra;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FlightBloc(repository: _flightBookingRepository),
        ),
        BlocProvider(
          create: (context) =>
              TravellerBloc(repository: _flightBookingRepository),
        ),
        BlocProvider(
          create: (context) => ProfileBloc(profileRepository: _profileRepo),
        ),
        BlocProvider(
          create: (context) => StatesBloc(repository: _statesRepository),
        ),
        BlocProvider(
          create: (context) => CityBloc(repository: _statesRepository),
        ),
        BlocProvider(
          create: (context) => WalletBloc(
              WalletRepository(WalletRemoteDataSrc(apiClient: _apiClient))),
        ),
      ],
      child: FlightDetailsScreen(
        flightDictionary: extra['flightDictionary'] ?? {},
        data: extra['data'] ?? {},
        arivalCity: extra['arivalCity'] ?? '',
        arivalAirport: extra['arivalAirport'] ?? '',
        departureCity: extra['departureCity'] ?? '',
        departureAirport: extra['departureAirport'] ?? '',
      ),
    );
  }

  //booking policy
  static const String bookingPolicy = '/booking-policy';
  static const String bookingPolicyName = 'bookingPolicy';
  static Widget bookingPolicyBuilder() => const BookingPolicy();
}
