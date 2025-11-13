import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:excellistravel/core/network/api_response.dart';

import '../../data/location_repository.dart';
import '../../models/city_model.dart';

part 'city_event.dart';
part 'city_state.dart';

class CityBloc extends Bloc<CityEvent, CityState> {
  CityBloc({
    required this.repository,
  }) : super(CityInitial()) {
    on<CityEvent>((CityEvent event, Emitter<CityState> emit) {});
    on<GetCityEvent>(_handleGetCity);
  }
  final LocationRepository repository;
  Future<void> _handleGetCity(
      GetCityEvent event, Emitter<CityState> emit) async {
    try {
      emit(GetCityLoading());
      final List<CityModel> cities = <CityModel>[];
      final ApiResponse<List<CityModel>> res = await repository.getCities(
          stateId: event.stateId, stateCode: event.stateCode);
      if (res.errorMessage == null || res.errorMessage == '') {
        //remove duplicates name if exists
        res.data?.forEach((CityModel remoteCity) {
          if (cities.isNotEmpty) {
            if (cities
                .where(
                    (CityModel localCity) => localCity.name == remoteCity.name)
                .isEmpty) {
              cities.add(remoteCity);
            }
          } else {
            cities.add(remoteCity);
          }
        });

        emit(CityLoaded(cities: cities));
        return;
      }
      emit(GetCityError(res.errorMessage ?? 'Something went wrong'));
    } catch (e) {
      emit(GetCityError(e.toString()));
    }
  }
}
