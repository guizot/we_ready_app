import 'package:flutter/material.dart';
import 'package:we_ready_app/presentation/core/widget/ceremony_item.dart';
import '../../core/widget/header_item.dart';
import '../../core/widget/vendor_item.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});
  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {

  @override
  Widget build(BuildContext context) {
    return ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          HeaderItem(
            name: "Jack & Gill",
          ),
          CeremonyItem(
              ceremonyName: "Acara Pernikahan"
          ),
          VendorItem(
            vendorName: "Joelle Decoration",
            vendorType: "Decoration",
            amount: "Rp 50.000.000",
          ),
          VendorItem(
            vendorName: "Joelle Decoration",
            vendorType: "Decoration",
            amount: "Rp 50.000.000",
          ),
          VendorItem(
            vendorName: "Joelle Decoration",
            vendorType: "Decoration",
            amount: "Rp 50.000.000",
          ),
        ],
    );
  }

}