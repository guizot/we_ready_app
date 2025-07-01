import 'package:we_ready_app/domain/repositories/hive_repo.dart';
import '../../data/core/const/hive_values.dart';
import '../../data/models/local/vendor_model.dart';

class VendorUseCases {

  /// REGION: INIT USE CASE
  final HiveRepo hiveRepo;
  VendorUseCases({required this.hiveRepo});

  List<Vendor> getAllVendor() {
    try {
      final selected = getSelectedEvent();
      if (selected != null) {
        final eventId = selected['id'];
        final allVendors = hiveRepo.getAllVendor();
        return allVendors.where((vendor) => vendor.eventId == eventId).toList();
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
    // space for business logic (before return / before send)
    return hiveRepo.saveVendor(item.id, item);
  }

  Future<void> deleteVendor(String id) async {
    try {
      final allPayments = hiveRepo.getAllPayment();
      final paymentIdsToDelete = allPayments
          .where((payment) => payment.vendorId == id)
          .map((payment) => payment.id)
          .toList();

      await hiveRepo.deleteAllPayment(paymentIdsToDelete);
      await hiveRepo.deleteVendor(id);
    } catch (e) {
      rethrow;
    }
  }

  dynamic getSelectedEvent() {
    return hiveRepo.getSetting(HiveValues.eventSelected);
  }

}