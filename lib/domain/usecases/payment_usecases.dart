import 'package:we_ready_app/domain/repositories/hive_repo.dart';
import 'package:we_ready_app/presentation/core/extension/number_extension.dart';
import '../../data/core/const/hive_values.dart';
import '../../data/models/local/payment_model.dart';
import '../../data/models/local/vendor_model.dart';

class PaymentUseCases {

  final HiveRepo hiveRepo;
  PaymentUseCases({required this.hiveRepo});

  List<Payment> getAllPayment(String vendorId) {
    try {
      final allPayments = hiveRepo.getAllPayment();
      final filteredPayments = allPayments
          .where((payment) => payment.vendorId == vendorId)
          .toList();
      filteredPayments.sort((a, b) {
        final aTime = a.createdAt;
        final bTime = b.createdAt;
        return aTime.compareTo(bTime);
      });
      return filteredPayments;
    } catch (e) {
      return [];
    }
  }

  Payment? getPayment(String id) {
    // space for business logic (before return / before send)
    return hiveRepo.getPayment(id);
  }

  Future<void> savePayment(Payment item) async {
    await hiveRepo.savePayment(item.id, item);
    await updateVendorSummary();
  }

  Future<void> deletePayment(String id) async {
    await hiveRepo.deletePayment(id);
    await updateVendorSummary();
  }

  Vendor? getVendor(String id) {
    // space for business logic (before return / before send)
    return hiveRepo.getVendor(id);
  }

  Future<void> updateVendorSummary() async {
    final selected = getSelectedEvent();
    if (selected == null || selected['id'] == null) return;

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

    final unpaid = total - paid;
    final unusedBudget = total < budget ? budget - total : 0;
    final overBudget = total > budget ? total - budget : 0;

    final summary = {
      'budget': 'Rp ${budget.toCurrencyFormat()}',
      'unusedBudget': 'Rp ${unusedBudget.toCurrencyFormat()}',
      'overBudget': 'Rp ${overBudget.toCurrencyFormat()}',
      'paid': 'Rp ${paid.toCurrencyFormat()}',
      'unpaid': 'Rp ${unpaid.toCurrencyFormat()}',
      'total': 'Rp ${total.toCurrencyFormat()}',
    };

    await hiveRepo.saveSetting('${HiveValues.summaryVendor}_$eventId', summary);
  }

  dynamic getSelectedEvent() {
    return hiveRepo.getSetting(HiveValues.eventSelected);
  }

}