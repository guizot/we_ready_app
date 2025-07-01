import 'package:flutter/material.dart';
import 'package:we_ready_app/presentation/core/model/payment_args.dart';
import 'package:we_ready_app/presentation/pages/event/event_add.dart';
import 'package:we_ready_app/presentation/pages/invitation/invitation_add.dart';
import 'package:we_ready_app/presentation/pages/payment/payment.dart';
import 'package:we_ready_app/presentation/pages/payment/payment_add.dart';
import 'package:we_ready_app/presentation/pages/rundown/rundown_add.dart';
import 'package:we_ready_app/presentation/pages/vendor/vendor_add.dart';
import '../../pages/home.dart';
import '../../pages/setting/setting.dart';
import '../constant/routes_values.dart';

class RouteService {

  static Route<dynamic> generate(RouteSettings settings) {
    switch (settings.name) {
      case RoutesValues.home:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case RoutesValues.payment:
        var vendorId = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => PaymentPageProvider(vendorId: vendorId));
      case RoutesValues.vendorAdd:
        var id = settings.arguments as String?;
        return MaterialPageRoute(builder: (_) => VendorAddProvider(id: id));
      case RoutesValues.invitationAdd:
        var id = settings.arguments as String?;
        return MaterialPageRoute(builder: (_) => InvitationAddProvider(id: id));
      case RoutesValues.rundownAdd:
        var id = settings.arguments as String?;
        return MaterialPageRoute(builder: (_) => RundownAddProvider(id: id));
      case RoutesValues.paymentAdd:
        var args = settings.arguments as PaymentArgs;
        return MaterialPageRoute(builder: (_) => PaymentAddProvider(item: args));
      case RoutesValues.eventAdd:
        var id = settings.arguments as String?;
        return MaterialPageRoute(builder: (_) => EventAddProvider(id: id));
      case RoutesValues.setting:
        return MaterialPageRoute(builder: (_) => const SettingPage());
      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            appBar: AppBar(title: const Text("Error")),
            body: const Center(child: Text('Error page')),
          );
        });
    }
  }

}