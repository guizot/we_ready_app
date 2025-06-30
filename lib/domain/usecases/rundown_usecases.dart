import 'package:we_ready_app/domain/repositories/hive_repo.dart';
import '../../data/core/const/hive_values.dart';
import '../../data/models/local/rundown_model.dart';

class RundownUseCases {

  /// REGION: INIT USE CASE
  final HiveRepo hiveRepo;
  RundownUseCases({required this.hiveRepo});

  List<Rundown> getAllRundown() {
    try {
      final selected = getSelectedEvent();
      if (selected != null) {
        final eventId = selected['id'];
        final allRundowns = hiveRepo.getAllRundown();
        return allRundowns.where((rundown) => rundown.eventId == eventId).toList();
      }
      return [];
    } catch (e) {
      return [];
    }
  }

  Rundown? getRundown(String id) {
    // space for business logic (before return / before send)
    return hiveRepo.getRundown(id);
  }

  Future<void> saveRundown(Rundown item) async {
    // space for business logic (before return / before send)
    return hiveRepo.saveRundown(item.id, item);
  }

  Future<void> deleteRundown(String id) async {
    // space for business logic (before return / before send)
    return hiveRepo.deleteRundown(id);
  }

  dynamic getSelectedEvent() {
    return hiveRepo.getSetting(HiveValues.eventSelected);
  }

}