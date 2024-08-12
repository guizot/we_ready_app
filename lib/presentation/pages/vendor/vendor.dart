import 'package:flutter/material.dart';
import 'package:we_ready_app/presentation/core/constant/icon_values.dart';
import '../../core/constant/routes_values.dart';
import '../../core/widget/header_item.dart';
import 'vendor_item.dart';
import 'vendor_summary.dart';

class VendorPage extends StatefulWidget {
  const VendorPage({super.key});
  @override
  State<VendorPage> createState() => _VendorPageState();
}

class _VendorPageState extends State<VendorPage> {

  @override
  Widget build(BuildContext context) {
    return ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          HeaderItem(
            name: "Jack & Gill",
            onAdd: () {
              Navigator.pushNamed(context, RoutesValues.vendorAdd);
            },
          ),
          const VendorSummary(
            ceremonyName: "Acara Pernikahan"
          ),
          const VendorItem(
            vendorName: "Joelle Decoration",
            vendorType: "Decoration",
            amount: "Rp 50.000.000",
            icon: IconValues.partyPopper
          ),
          const VendorItem(
            vendorName: "Red Hat Organizer",
            vendorType: "Wedding Organizer",
            amount: "Rp 28.000.000",
            icon: IconValues.megaphone
          ),
        ],
    );
  }

}