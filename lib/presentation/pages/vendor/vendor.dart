import 'package:flutter/material.dart';
import 'package:we_ready_app/presentation/core/constant/icon_values.dart';
import 'vendor_item.dart';

class VendorPage extends StatefulWidget {
  const VendorPage({super.key});
  @override
  State<VendorPage> createState() => _VendorPageState();
}

class _VendorPageState extends State<VendorPage> {

  final List<Map<String, dynamic>> vendorItems = [
    {
      "vendorName": "Joelle Decoration",
      "vendorType": "Decoration",
      "amount": "Rp 50.000.000",
      "icon": IconValues.partyPopper,
    },
    {
      "vendorName": "Red Hat Organizer",
      "vendorType": "Wedding Organizer",
      "amount": "Rp 28.000.000",
      "icon": IconValues.megaphone,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ...vendorItems.map((item) => VendorItem(
            vendorName: item['vendorName'],
            vendorType: item['vendorType'],
            amount: item['amount'],
            icon: item['icon'],
          )),
        ],
    );
  }

}