import 'package:we_ready_app/data/core/const/hive_values.dart';
import 'package:we_ready_app/domain/repositories/hive_repo.dart';
import 'package:we_ready_app/presentation/core/constant/initial_values.dart';
import 'package:we_ready_app/presentation/core/extension/event_extension.dart';
import 'package:we_ready_app/presentation/core/extension/number_extension.dart';
import 'package:we_ready_app/presentation/core/extension/string_extension.dart';
import '../../data/models/local/event_model.dart';

class EventUseCases {

  final HiveRepo hiveRepo;
  EventUseCases({required this.hiveRepo});

  List<Event> getAllEvent() {
    final events = hiveRepo.getAllEvent();
    events.sort((a, b) => a.title.toLowerCase().compareTo(b.title.toLowerCase()));
    try {
      final selectedItem = getSelectedEvent();
      final selectedId = selectedItem['id'];
      for (final e in events) {
        e.selected = (e.id == selectedId);
      }
    } catch (e) {
      if (events.isNotEmpty) {
        events.first.selected = true;
      }
    }
    return events;
  }

  Event? getEvent(String id) {
    // space for business logic (before return / before send)
    return hiveRepo.getEvent(id);
  }

  Future<void> saveEvent(Event item) async {
    final existing = getEvent(item.id);
    await hiveRepo.saveEvent(item.id, item);
    if (existing == null) {
      await createEmptySummary(item);
      await putSelectedEvent(item);
    } else {
      final selected = getSelectedEvent();
      final isSelected = selected != null && selected['id'] == item.id;
      await updateVendorSummary(item);
      if (isSelected) {
        await putSelectedEvent(item);
      }
    }
  }

  Future<void> deleteEvent(String id) async {
    final selectedItem = getSelectedEvent();
    final selectedId = selectedItem?['id'];

    // Delete all related VENDORS and their PAYMENTS
    final allVendors = hiveRepo.getAllVendor();
    final vendorsToDelete = allVendors.where((v) => v.eventId == id).toList();

    // Collect vendor IDs and related payment IDs
    final vendorIds = vendorsToDelete.map((v) => v.id).toSet();
    final allPayments = hiveRepo.getAllPayment();
    final paymentIds = allPayments
        .where((p) => vendorIds.contains(p.vendorId))
        .map((p) => p.id)
        .toList();

    await hiveRepo.deleteAllPayment(paymentIds);
    await hiveRepo.deleteAllVendor(vendorIds);

    // Delete all related INVITATIONS
    final allInvitations = hiveRepo.getAllInvitation();
    final invitationIds = allInvitations
        .where((i) => i.eventId == id)
        .map((i) => i.id)
        .toList();

    await hiveRepo.deleteAllInvitation(invitationIds);

    // Delete all related RUNDOWNS
    final allRundowns = hiveRepo.getAllRundown();
    final rundownIds = allRundowns
        .where((r) => r.eventId == id)
        .map((r) => r.id)
        .toList();

    await hiveRepo.deleteAllRundown(rundownIds);

    // Delete the EVENT itself
    await hiveRepo.deleteEvent(id);
    await deleteSummary(id);

    // Update selected event if needed
    if (selectedId == id) {
      final events = hiveRepo.getAllEvent();
      if (events.isNotEmpty) {
        await putSelectedEvent(events.first);
      } else {
        await hiveRepo.deleteSetting(HiveValues.eventSelected);
      }
    }
  }


  Future<void> putSelectedEvent(Event item) async {
    hiveRepo.saveSetting(HiveValues.eventSelected, item.toMap());
    getAllEvent();
  }

  dynamic getSelectedEvent() {
    return hiveRepo.getSetting(HiveValues.eventSelected);
  }


  Future<void> updateVendorSummary(Event item) async {
    final eventId = item.id;

    final allVendors = hiveRepo.getAllVendor().where((v) => v.eventId == eventId).toList();
    final allPayments = hiveRepo.getAllPayment();

    final budget = int.tryParse(
        item.budget.replaceAll(RegExp(r'[^0-9]'), '')
    ) ?? 0;
    int total = 0;
    int paid = 0;

    for (final v in allVendors) {
      total += int.tryParse(v.budget.replaceAll(RegExp(r'[^0-9]'), '')) ?? 0;

      final vendorPayments = allPayments.where((p) => p.vendorId == v.id);
      for (final p in vendorPayments) {
        paid += int.tryParse(p.amount.replaceAll(RegExp(r'[^0-9]'), '')) ?? 0;
      }
    }

    final unpaid = (total - paid) < 0 ? 0 : total - paid;
    final overPaid = (paid - total) > 0 ? paid - total : 0;
    final unusedBudget = total < budget ? budget - total : 0;
    final overBudget = total > budget ? total - budget : 0;

    final updated = {
      'budget': 'Rp ${budget.toCurrencyFormat()}',
      'unusedBudget': 'Rp ${unusedBudget.toCurrencyFormat()}',
      'overBudget': 'Rp ${overBudget.toCurrencyFormat()}',
      'paid': 'Rp ${paid.toCurrencyFormat()}',
      'unpaid': 'Rp ${unpaid.toCurrencyFormat()}',
      'overPaid': 'Rp ${overPaid.toCurrencyFormat()}',
      'total': 'Rp ${total.toCurrencyFormat()}',
    };

    await saveSummaryVendor(eventId, updated);
  }

  Future<void> createEmptySummary(Event item) async {
    await saveSummaryVendor(item.id, InitialValues().vendorInit(item.budget.toCurrencyFormat()));
    await saveSummaryInvitation(item.id, InitialValues().invitationInit());
    await saveSummaryRundown(item.id, InitialValues().rundownInit());
  }

  Future<void> saveSummaryVendor(String eventId, Map<String, dynamic> summary) async {
    await hiveRepo.saveSetting('${HiveValues.summaryVendor}_$eventId', summary);
  }

  Future<void> saveSummaryInvitation(String eventId, Map<String, dynamic> summary) async {
    await hiveRepo.saveSetting('${HiveValues.summaryInvitation}_$eventId', summary);
  }

  Future<void> saveSummaryRundown(String eventId, Map<String, dynamic> summary) async {
    await hiveRepo.saveSetting('${HiveValues.summaryRundown}_$eventId', summary);
  }

  Future<void> deleteSummary(String eventId) async {
    await hiveRepo.deleteSetting('${HiveValues.summaryVendor}_$eventId');
    await hiveRepo.deleteSetting('${HiveValues.summaryInvitation}_$eventId');
    await hiveRepo.deleteSetting('${HiveValues.summaryRundown}_$eventId');
  }

  Map<String, dynamic>? getSummaryVendor() {
    try {
      final selected = getSelectedEvent();
      if (selected != null) {
        final eventId = selected['id'];
        final item = hiveRepo.getSetting('${HiveValues.summaryVendor}_$eventId');
        if (item is Map) {
          return Map<String, dynamic>.from(item);
        }
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  Map<String, dynamic>? getSummaryInvitation() {
    try {
      final selected = getSelectedEvent();
      if (selected != null) {
        final eventId = selected['id'];
        final item = hiveRepo.getSetting('${HiveValues.summaryInvitation}_$eventId');
        if (item is Map) {
          return Map<String, dynamic>.from(item);
        }
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  Map<String, dynamic>? getSummaryRundown() {
    try {
      final selected = getSelectedEvent();
      if (selected != null) {
        final eventId = selected['id'];
        final item = hiveRepo.getSetting('${HiveValues.summaryRundown}_$eventId');
        if (item is Map) {
          return Map<String, dynamic>.from(item);
        }
      }
      return null;
    } catch (e) {
      return null;
    }
  }

}