import 'package:we_ready_app/domain/repositories/hive_repo.dart';
import '../../data/models/local/payment_model.dart';

class PaymentUseCases {

  /// REGION: INIT USE CASE
  final HiveRepo hiveRepo;
  PaymentUseCases({required this.hiveRepo});

  List<Payment> getAllPayment() {
    // space for business logic (before return / before send)
    return hiveRepo.getAllPayment();
  }

  Payment? getPayment(String id) {
    // space for business logic (before return / before send)
    return hiveRepo.getPayment(id);
  }

  Future<void> savePayment(Payment item) async {
    // space for business logic (before return / before send)
    return hiveRepo.savePayment(item.id, item);
  }

  Future<void> deletePayment(String id) async {
    // space for business logic (before return / before send)
    return hiveRepo.deletePayment(id);
  }

}