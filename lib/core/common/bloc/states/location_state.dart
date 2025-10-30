part of 'location_bloc.dart';
sealed class LocationState extends Equatable {
  const LocationState();

  @override
  List<Object> get props => [];
}

final class LocationInitial extends LocationState {}

//states
final class GetStates extends LocationState {}

final class GetStateLoading extends LocationState {}

final class StatesLoaded extends LocationState {
  final List<StateModel> states;
  const StatesLoaded({required this.states});
}

final class GetStateError extends LocationState {
  final String errorMessage;
  const GetStateError(this.errorMessage);
}
