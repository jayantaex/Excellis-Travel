import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../network/api_response.dart';
import '../../data/location_repository.dart';
import '../../models/state_model.dart';
part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final LocationRepository repository;
  LocationBloc({
    required this.repository,
  }) : super(LocationInitial()) {
    on<LocationEvent>((event, emit) {});

    on<GetStatesEvent>(_handleGetStates);
  }

  Future _handleGetStates(
      GetStatesEvent event, Emitter<LocationState> emit) async {
    try {
      emit(GetStateLoading());
      List<StateModel> states = [];
      ApiResponse res = await repository.getStates();
      if (res.errorMessage == null || res.errorMessage == '') {
        states = res.data ?? [];
        emit(StatesLoaded(states: states));
        return;
      }
      emit(GetStateError(res.errorMessage ?? 'Something went wrong'));
    } catch (e) {
      emit(GetStateError(e.toString()));
    }
  }
}
