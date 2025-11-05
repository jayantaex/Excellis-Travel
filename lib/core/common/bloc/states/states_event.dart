part of 'states_bloc.dart';

sealed class StatesEvent extends Equatable {
  const StatesEvent();

  @override
  List<Object> get props => [];
}

final class GetStatesEvent extends StatesEvent {}
