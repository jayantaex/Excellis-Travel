part of 'city_bloc.dart';

sealed class CityState extends Equatable {
  const CityState();

  @override
  List<Object> get props => [];
}

final class CityInitial extends CityState {}

final class GetCityLoading extends CityState {}

final class CityLoaded extends CityState {
  const CityLoaded({required this.cities});
  final List<CityModel> cities;
}

final class GetCityError extends CityState {
  const GetCityError(this.errorMessage);
  final String errorMessage;
}
