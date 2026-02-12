import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../network/api_client.dart';
import 'api/location_api.dart';
import 'bloc/cities/city_bloc.dart';
import 'data/location_repository.dart';
import 'screens/city_search.dart';

class CommonModule {
  static String citySearchName = 'city_search';
  static String citySearchRoute = '/city-search';
  static String stateSearchName = 'state_search';
  static String stateSearchRoute = '/state-search';
  static final LocationRepository _locationRepository =
      LocationRepository(statesApi: LocationApi(apiClient: ApiClient()));

  static Widget citySearchBuilder(BuildContext context, state) {
    final String stateCode = state.extra['stateCode'] ?? '';
    final String stateName = state.extra['stateName'];
    final int stateId = state.extra['stateId'];

    return BlocProvider<CityBloc>(
      create: (BuildContext context) =>
          CityBloc(repository: _locationRepository),
      child: CitySearch(
        onSelected: state.extra['onSelected'],
        stateCode: stateCode,
        stateName: stateName,
        stateId: stateId,
      ),
    );
  }
}
