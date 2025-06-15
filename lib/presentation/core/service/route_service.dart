import 'package:flutter/material.dart';
import 'package:we_ready_app/presentation/pages/ceremony/ceremony_add.dart';
import 'package:we_ready_app/presentation/pages/invitation/invitation_add.dart';
import 'package:we_ready_app/presentation/pages/payment/payment.dart';
import 'package:we_ready_app/presentation/pages/payment/payment_add.dart';
import 'package:we_ready_app/presentation/pages/rundown/rundown_add.dart';
import 'package:we_ready_app/presentation/pages/vendor/vendor_add.dart';
import '../../pages/home/home.dart';
import '../constant/routes_values.dart';

class RouteService {

  static Route<dynamic> generate(RouteSettings settings) {
    switch (settings.name) {
      case RoutesValues.home:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case RoutesValues.payment:
        return MaterialPageRoute(builder: (_) => const PaymentPage());
      case RoutesValues.vendorAdd:
        var id = settings.arguments as String?;
        return MaterialPageRoute(builder: (_) => VendorAdd(id: id));
      case RoutesValues.invitationAdd:
        var id = settings.arguments as String?;
        return MaterialPageRoute(builder: (_) => InvitationAdd(id: id));
      case RoutesValues.rundownAdd:
        var id = settings.arguments as String?;
        return MaterialPageRoute(builder: (_) => RundownAdd(id: id));
      case RoutesValues.paymentAdd:
        var id = settings.arguments as String?;
        return MaterialPageRoute(builder: (_) => PaymentAdd(id: id));
      case RoutesValues.ceremonyAdd:
        var id = settings.arguments as String?;
        return MaterialPageRoute(builder: (_) => CeremonyAdd(id: id));
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