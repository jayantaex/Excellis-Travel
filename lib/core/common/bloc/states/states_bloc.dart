import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../network/api_response.dart';
import '../../data/location_repository.dart';
import '../../models/state_model.dart';
part 'states_event.dart';
part 'states_state.dart';

class StatesBloc extends Bloc<StatesEvent, StatesState> {
  final LocationRepository repository;
  StatesBloc({
    required this.repository,
  }) : super(LocationInitial()) {
    on<StatesEvent>((event, emit) {});

    on<GetStatesEvent>(_handleGetStates);
  }

  Future _handleGetStates(
      GetStatesEvent event, Emitter<StatesState> emit) async {
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
