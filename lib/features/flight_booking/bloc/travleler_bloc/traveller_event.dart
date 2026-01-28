part of 'traveller_bloc.dart';

sealed class TravellerEvent extends Equatable {
  const TravellerEvent();

  @override
  List<Object> get props => [];
}

final class CreateTravelerEvent extends TravellerEvent {
  const CreateTravelerEvent({required this.body});
  final Map<String, dynamic> body;
}

final class GetTravelersEvent extends TravellerEvent {
  const GetTravelersEvent();
}
