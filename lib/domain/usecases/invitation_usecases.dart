import 'package:we_ready_app/domain/repositories/hive_repo.dart';
import '../../data/models/local/invitation_model.dart';

class InvitationUseCases {

  /// REGION: INIT USE CASE
  final HiveRepo hiveRepo;
  InvitationUseCases({required this.hiveRepo});

  List<Invitation> getAllInvitation() {
    // space for business logic (before return / before send)
    return hiveRepo.getAllInvitation();
  }

  Invitation? getInvitation(String id) {
    // space for business logic (before return / before send)
    return hiveRepo.getInvitation(id);
  }

  Future<void> saveInvitation(Invitation item) async {
    // space for business logic (before return / before send)
    return hiveRepo.saveInvitation(item.id, item);
  }

  Future<void> deleteInvitation(String id) async {
    // space for business logic (before return / before send)
    return hiveRepo.deleteInvitation(id);
  }

}