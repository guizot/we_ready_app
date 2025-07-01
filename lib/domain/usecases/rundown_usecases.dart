import 'package:we_ready_app/domain/repositories/hive_repo.dart';
import '../../data/core/const/hive_values.dart';
import '../../data/models/local/rundown_model.dart';
import 'package:intl/intl.dart';

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
        final filteredRundowns = allRundowns
            .where((rundown) => rundown.eventId == eventId)
            .toList();
        final dateFormat = DateFormat('dd MMM yyyy - HH:mm');
        filteredRundowns.sort((a, b) {
          final aTime = dateFormat.parse(a.start);
          final bTime = dateFormat.parse(b.start);
          return aTime.compareTo(bTime);
        });
        return filteredRundowns;
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