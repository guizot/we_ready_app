import 'package:we_ready_app/data/models/local/event_model.dart';
import '../../domain/repositories/hive_repo.dart';
import '../datasource/local/hive_data_source.dart';
import '../models/local/invitation_model.dart';
import '../models/local/payment_model.dart';
import '../models/local/rundown_model.dart';
import '../models/local/vendor_model.dart';

class HiveRepoImpl implements HiveRepo {

  final HiveDataSource hiveDataSource;

  HiveRepoImpl({
    required this.hiveDataSource,
  });

  // region EVENT

  @override
  List<Event> getAllEvent() {
    return hiveDataSource.eventBox.values.toList();
  }

  @override
  Event? getEvent(String id) {
    return hiveDataSource.eventBox.get(id);
  }

  @override
  Future<void> saveEvent(String id, Event item) async {
    await hiveDataSource.eventBox.put(id, item);
  }

  @override
  Future<void> deleteEvent(String id) async {
    await hiveDataSource.eventBox.delete(id);
  }

  @override
  Future<void> deleteAllEvent(Iterable<dynamic> keys) async {
    await hiveDataSource.eventBox.deleteAll(keys);
  }

  // endregion

  // region VENDOR

  @override
  List<Vendor> getAllVendor() {
    return hiveDataSource.vendorBox.values.toList();
  }

  @override
  Vendor? getVendor(String id) {
    return hiveDataSource.vendorBox.get(id);
  }

  @override
  Future<void> saveVendor(String id, Vendor item) async {
    await hiveDataSource.vendorBox.put(id, item);
  }

  @override
  Future<void> deleteVendor(String id) async {
    await hiveDataSource.vendorBox.delete(id);
  }

  @override
  Future<void> deleteAllVendor(Iterable<dynamic> keys) async {
    await hiveDataSource.vendorBox.deleteAll(keys);
  }

  // endregion

  // region INVITATION

  @override
  List<Invitation> getAllInvitation() {
    return hiveDataSource.invitationBox.values.toList();
  }

  @override
  Invitation? getInvitation(String id) {
    return hiveDataSource.invitationBox.get(id);
  }

  @override
  Future<void> saveInvitation(String id, Invitation item) async {
    await hiveDataSource.invitationBox.put(id, item);
  }

  @override
  Future<void> deleteInvitation(String id) async {
    await hiveDataSource.invitationBox.delete(id);
  }

  @override
  Future<void> deleteAllInvitation(Iterable<dynamic> keys) async {
    await hiveDataSource.invitationBox.deleteAll(keys);
  }

  // endregion

  // region RUNDOWN

  @override
  List<Rundown> getAllRundown() {
    return hiveDataSource.rundownBox.values.toList();
  }

  @override
  Rundown? getRundown(String id) {
    return hiveDataSource.rundownBox.get(id);
  }

  @override
  Future<void> saveRundown(String id, Rundown item) async {
    await hiveDataSource.rundownBox.put(id, item);
  }

  @override
  Future<void> deleteRundown(String id) async {
    await hiveDataSource.rundownBox.delete(id);
  }

  @override
  Future<void> deleteAllRundown(Iterable<dynamic> keys) async {
    await hiveDataSource.rundownBox.deleteAll(keys);
  }

  // endregion

  // region PAYMENT

  @override
  List<Payment> getAllPayment() {
    return hiveDataSource.paymentBox.values.toList();
  }

  @override
  Payment? getPayment(String id) {
    return hiveDataSource.paymentBox.get(id);
  }

  @override
  Future<void> savePayment(String id, Payment item) async {
    await hiveDataSource.paymentBox.put(id, item);
  }

  @override
  Future<void> deletePayment(String id) async {
    await hiveDataSource.paymentBox.delete(id);
  }

  @override
  Future<void> deleteAllPayment(Iterable<dynamic> keys) async {
    await hiveDataSource.paymentBox.deleteAll(keys);
  }

  // endregion

  // region SETTING

  @override
  dynamic getSetting(String key) {
    return hiveDataSource.settingBox.get(key);
  }

  @override
  Future<void> saveSetting(String key, item) async {
    await hiveDataSource.settingBox.put(key, item);
  }

  @override
  Future<void> deleteSetting(String key) async {
    await hiveDataSource.settingBox.delete(key);
  }

  // endregion

}