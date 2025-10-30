part of 'city_bloc.dart';

sealed class CityState extends Equatable {
  const CityState();

  @override
  List<Object> get props => [];
}

final class CityInitial extends CityState {}

final class GetCityLoading extends CityState {}

final class CityLoaded extends CityState {
  final List<CityModel> cities;
  const CityLoaded({required this.cities});
}

final class GetCityError extends CityState {
  final String errorMessage;
  const GetCityError(this.errorMessage);
}
