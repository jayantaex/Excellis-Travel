part of 'traveller_bloc.dart';

sealed class TravellerState extends Equatable {
  const TravellerState();

  @override
  List<Object> get props => [];
}

final class TravellerInitial extends TravellerState {}

final class TravellerLoading extends TravellerState {}

final class TravellerLoaded extends TravellerState {
  const TravellerLoaded({required this.data});
  final List<TravelerDataModel>? data;
}

final class TravellerError extends TravellerState {
  const TravellerError({required this.error});
  final String error;
}

final class TravellerCreated extends TravellerState {
  const TravellerCreated();
}
