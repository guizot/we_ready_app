import 'package:we_ready_app/domain/repositories/hive_repo.dart';
import '../../data/models/local/rundown_model.dart';

class RundownUseCases {

  /// REGION: INIT USE CASE
  final HiveRepo hiveRepo;
  RundownUseCases({required this.hiveRepo});

  List<Rundown> getAllRundown() {
    // space for business logic (before return / before send)
    return hiveRepo.getAllRundown();
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

}