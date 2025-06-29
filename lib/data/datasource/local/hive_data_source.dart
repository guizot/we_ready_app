import 'package:hive_flutter/hive_flutter.dart';
import '../../models/local/event_model.dart';
import '../../models/local/invitation_model.dart';
import '../../models/local/payment_model.dart';
import '../../models/local/rundown_model.dart';
import '../../models/local/vendor_model.dart';

class HiveDataSource {

  /// Init Hive Local Storage
  static Future<void> init() async {
    await Hive.initFlutter();

    /// Define the adapters
    Hive.registerAdapter(EventAdapter());
    Hive.registerAdapter(VendorAdapter());
    Hive.registerAdapter(PaymentAdapter());
    Hive.registerAdapter(InvitationAdapter());
    Hive.registerAdapter(RundownAdapter());

    /// Open the boxes
    await Hive.openBox<Event>('eventBox');
    await Hive.openBox<Vendor>('vendorBox');
    await Hive.openBox<Payment>('paymentBox');
    await Hive.openBox<Invitation>('invitationBox');
    await Hive.openBox<Rundown>('rundownBox');
    await Hive.openBox('settingBox');
  }

  /// Get the boxes
  Box<Event> get eventBox => Hive.box<Event>('eventBox');
  Box<Vendor> get vendorBox => Hive.box<Vendor>('vendorBox');
  Box<Payment> get paymentBox => Hive.box<Payment>('paymentBox');
  Box<Invitation> get invitationBox => Hive.box<Invitation>('invitationBox');
  Box<Rundown> get rundownBox => Hive.box<Rundown>('rundownBox');
  Box get settingBox => Hive.box('settingBox');

}