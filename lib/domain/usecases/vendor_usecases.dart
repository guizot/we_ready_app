import 'package:we_ready_app/domain/repositories/hive_repo.dart';
import 'package:we_ready_app/presentation/core/extension/number_extension.dart';
import '../../data/core/const/hive_values.dart';
import '../../data/models/local/vendor_model.dart';

class VendorUseCases {

  final HiveRepo hiveRepo;
  VendorUseCases({required this.hiveRepo});

  List<Vendor> getAllVendor() {
    try {
      final selected = getSelectedEvent();
      if (selected != null) {
        final eventId = selected['id'];
        final allVendors = hiveRepo.getAllVendor();
        final filteredVendors = allVendors
            .where((vendor) => vendor.eventId == eventId)
            .toList();
        filteredVendors.sort((a, b) {
          final aTime = a.createdAt;
          final bTime = b.createdAt;
          return bTime.compareTo(aTime);
        });
        return filteredVendors;
      }
      return [];
    } catch (e) {
      return [];
    }
  }

  Vendor? getVendor(String id) {
    // space for business logic (before return / before send)
    return hiveRepo.getVendor(id);
  }

  Future<void> saveVendor(Vendor item) async {
    await hiveRepo.saveVendor(item.id, item);
    await updateVendorSummary();
  }

  Future<void> deleteVendor(String id) async {
    final allPayments = hiveRepo.getAllPayment();
    final paymentIdsToDelete = allPayments
        .where((payment) => payment.vendorId == id)
        .map((payment) => payment.id)
        .toList();

    await hiveRepo.deleteAllPayment(paymentIdsToDelete);
    await hiveRepo.deleteVendor(id);
    await updateVendorSummary();
  }

  Future<void> updateVendorSummary() async {
    final selected = getSelectedEvent();
    if (selected == null|| selected['id'] == null) return;

    final eventId = selected['id'];
    final allVendors = hiveRepo.getAllVendor().where((v) => v.eventId == eventId).toList();
    final allPayments = hiveRepo.getAllPayment();

    final budget = int.tryParse(
      (selected['budget'] ?? '0').toString().replaceAll(RegExp(r'[^0-9]'), '')
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

    final summary = {
      'budget': 'Rp ${budget.toCurrencyFormat()}',
      'unusedBudget': 'Rp ${unusedBudget.toCurrencyFormat()}',
      'overBudget': 'Rp ${overBudget.toCurrencyFormat()}',
      'paid': 'Rp ${paid.toCurrencyFormat()}',
      'unpaid': 'Rp ${unpaid.toCurrencyFormat()}',
      'overPaid': 'Rp ${overPaid.toCurrencyFormat()}',
      'total': 'Rp ${total.toCurrencyFormat()}',
    };

    await hiveRepo.saveSetting('${HiveValues.summaryVendor}_$eventId', summary);
  }

  dynamic getSelectedEvent() {
    return hiveRepo.getSetting(HiveValues.eventSelected);
  }

}