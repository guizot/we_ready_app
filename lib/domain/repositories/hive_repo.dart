import 'package:we_ready_app/data/models/local/event_model.dart';
import '../../data/models/local/invitation_model.dart';
import '../../data/models/local/payment_model.dart';
import '../../data/models/local/rundown_model.dart';
import '../../data/models/local/vendor_model.dart';

abstract class HiveRepo {

  // region EVENT

  List<Event> getAllEvent();
  Event? getEvent(String id);
  Future<void> saveEvent(String id, Event item);
  Future<void> deleteEvent(String id);

  // endregion

  // region VENDOR

    List<Vendor> getAllVendor();
    Vendor? getVendor(String id);
    Future<void> saveVendor(String id, Vendor item);
    Future<void> deleteVendor(String id);

  // endregion

  // region INVITATION

  List<Invitation> getAllInvitation();
  Invitation? getInvitation(String id);
  Future<void> saveInvitation(String id, Invitation item);
  Future<void> deleteInvitation(String id);

  // endregion

  // region RUNDOWN

  List<Rundown> getAllRundown();
  Rundown? getRundown(String id);
  Future<void> saveRundown(String id, Rundown item);
  Future<void> deleteRundown(String id);

  // endregion

  // region PAYMENT

  List<Payment> getAllPayment();
  Payment? getPayment(String id);
  Future<void> savePayment(String id, Payment item);
  Future<void> deletePayment(String id);

  // endregion

  // region SETTING

  dynamic getSetting(String key);
  Future<void> saveSetting(String key, dynamic item);
  Future<void> deleteSetting(String key);

  // endregion

}