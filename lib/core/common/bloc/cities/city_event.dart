part of 'city_bloc.dart';

sealed class CityEvent extends Equatable {
  const CityEvent();

  @override
  List<Object> get props => [];
}

final class GetCityEvent extends CityEvent {
  final int stateId;
  final String stateCode;

  const GetCityEvent({required this.stateId, required this.stateCode});
}
