import 'package:we_ready_app/domain/repositories/hive_repo.dart';
import '../../data/core/const/hive_values.dart';
import '../../data/models/local/invitation_model.dart';
import '../../presentation/core/constant/initial_values.dart';

class InvitationUseCases {

  final HiveRepo hiveRepo;
  InvitationUseCases({required this.hiveRepo});

  List<Invitation> getAllInvitation() {
    try {
      final selected = getSelectedEvent();
      if (selected != null) {
        final eventId = selected['id'];
        final allInvitations = hiveRepo.getAllInvitation();
        final filteredInvitations = allInvitations
            .where((invitation) => invitation.eventId == eventId)
            .toList();
        filteredInvitations.sort((a, b) {
          final aTime = a.createdAt;
          final bTime = b.createdAt;
          return bTime.compareTo(aTime);
        });
        return filteredInvitations;
      }
      return [];
    } catch (e) {
      return [];
    }
  }

  Invitation? getInvitation(String id) {
    // space for business logic (before return / before send)
    return hiveRepo.getInvitation(id);
  }

  Future<void> saveInvitation(Invitation item) async {
    await hiveRepo.saveInvitation(item.id, item);
    final selected = getSelectedEvent();
    if (selected != null && selected is Map && selected['id'] != null) {
      await updateSummaryInvitation(selected['id']);
    }
  }

  Future<void> deleteInvitation(String id) async {
    await hiveRepo.deleteInvitation(id);
    final selected = getSelectedEvent();
    if (selected != null && selected is Map && selected['id'] != null) {
      await updateSummaryInvitation(selected['id']);
    }
  }

  Future<void> updateSummaryInvitation(String eventId) async {
    final allInvitations = hiveRepo.getAllInvitation()
        .where((inv) => inv.eventId == eventId)
        .toList();

    if (allInvitations.isEmpty) {
      await saveSummaryInvitation(eventId, InitialValues().invitationInit());
      return;
    }

    final totalMails = allInvitations.length;
    int totalPeoples = 0;
    int confirmed = 0;
    int unconfirmed = 0;

    for (var inv in allInvitations) {
      final count = int.tryParse(inv.invitationPackage) ?? 0;
      totalPeoples += count;

      if (inv.confirm.toLowerCase() == 'true') {
        confirmed += 1;
      } else {
        unconfirmed += 1;
      }
    }

    final updatedSummary = {
      'mails': '$totalMails Mail${totalMails <= 1 ? '' : 's'}',
      'peoples': '$totalPeoples People${totalPeoples <= 1 ? '' : 's'}',
      'confirmed': '$confirmed',
      'unconfirmed': '$unconfirmed',
    };

    await saveSummaryInvitation(eventId, updatedSummary);
  }

  Future<void> saveSummaryInvitation(String eventId, Map<String, dynamic> summary) async {
    await hiveRepo.saveSetting('${HiveValues.summaryInvitation}_$eventId', summary);
  }

  dynamic getSelectedEvent() {
    return hiveRepo.getSetting(HiveValues.eventSelected);
  }

}