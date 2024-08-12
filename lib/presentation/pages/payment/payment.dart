import 'package:flutter/material.dart';
import 'package:we_ready_app/presentation/pages/payment/payment_item.dart';
import '../../core/constant/routes_values.dart';
import 'payment_summary.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});
  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Payment Detail"),
        backgroundColor: Theme.of(context).colorScheme.surface,
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              icon: const Icon(Icons.add_circle_outline_sharp),
              tooltip: 'Add',
              onPressed: () {
                Navigator.pushNamed(context, RoutesValues.paymentAdd);
              },
            ),
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          PaymentSummary(
            vendorName: "We Ready Organizer"
          ),
          PaymentItem(
            paymentCount: "1st Payment",
            amount: "Rp 10.000.000",
            date: "10 Januari 2023"
          ),
          PaymentItem(
              paymentCount: "2nd Payment",
              amount: "Rp 5.000.000",
              date: "10 Februari 2023"
          ),
        ],
      )
    );
  }

}