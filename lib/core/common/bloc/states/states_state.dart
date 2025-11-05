part of 'states_bloc.dart';
sealed class StatesState extends Equatable {
  const StatesState();

  @override
  List<Object> get props => [];
}

final class LocationInitial extends StatesState {}

//states
final class GetStates extends StatesState {}

final class GetStateLoading extends StatesState {}

final class StatesLoaded extends StatesState {
  final List<StateModel> states;
  const StatesLoaded({required this.states});
}

final class GetStateError extends StatesState {
  final String errorMessage;
  const GetStateError(this.errorMessage);
}
