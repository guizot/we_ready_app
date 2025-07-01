import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../data/models/local/rundown_model.dart';
import '../../../../domain/usecases/rundown_usecases.dart';
import 'rundown_state.dart';

class RundownCubit extends Cubit<RundownCubitState> {

  final RundownUseCases rundownUseCases;
  RundownCubit({required this.rundownUseCases}) : super(RundownInitial());

  Future<void> getAllRundown() async {
    emit(RundownLoading());
    List<Rundown> rundowns = rundownUseCases.getAllRundown();
    if(rundowns.isEmpty) {
      emit(RundownEmpty());
    } else if(rundowns.isNotEmpty) {
      emit(RundownLoaded(rundowns: rundowns));
    }
  }

  Rundown? getRundown(String id) {
    emit(RundownLoading());
    Rundown? event = rundownUseCases.getRundown(id);
    emit(RundownInitial());
    return event;
  }

  Future<void> saveRundown(Rundown item) async {
    await rundownUseCases.saveRundown(item);
  }

  Future<void> deleteRundown(String id) async {
    await rundownUseCases.deleteRundown(id);
  }

  String? getSelectedEventId() {
    try {
      return rundownUseCases.getSelectedEvent()['id'];
    } catch(e) {
      return null;
    }
  }

}