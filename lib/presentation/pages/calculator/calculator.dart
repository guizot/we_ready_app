import 'package:flutter/material.dart';
import 'package:we_ready_app/presentation/core/constant/icon_values.dart';
import '../../core/widget/ceremony_calculator.dart';
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
          CeremonyCalculator(
            ceremonyName: "Acara Pernikahan"
          ),
          VendorItem(
            vendorName: "Joelle Decoration",
            vendorType: "Decoration",
            amount: "Rp 50.000.000",
            icon: IconValues.partyPopper
          ),
          VendorItem(
            vendorName: "Red Hat Organizer",
            vendorType: "Wedding Organizer",
            amount: "Rp 28.000.000",
            icon: IconValues.megaphone
          ),
        ],
    );
  }

}