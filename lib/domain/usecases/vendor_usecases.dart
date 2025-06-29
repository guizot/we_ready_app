import 'package:we_ready_app/domain/repositories/hive_repo.dart';
import '../../data/models/local/vendor_model.dart';

class VendorUseCases {

  /// REGION: INIT USE CASE
  final HiveRepo hiveRepo;
  VendorUseCases({required this.hiveRepo});

  List<Vendor> getAllVendor() {
    // space for business logic (before return / before send)
    return hiveRepo.getAllVendor();
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
    // space for business logic (before return / before send)
    return hiveRepo.deleteVendor(id);
  }

}