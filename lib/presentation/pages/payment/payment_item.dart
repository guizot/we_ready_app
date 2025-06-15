import 'package:flutter/material.dart';
import 'package:we_ready_app/presentation/core/constant/icon_values.dart';
import '../../core/constant/routes_values.dart';
import '../../core/widget/common_separator.dart';

class PaymentItem extends StatefulWidget {
  const PaymentItem({super.key, required this.paymentCount, required this.amount, required this.date });
  final String paymentCount;
  final String amount;
  final String date;

  @override
  State<PaymentItem> createState() => _PaymentItemState();
}

class _PaymentItemState extends State<PaymentItem> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, RoutesValues.paymentAdd, arguments: "123");
      },
      child: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                  Radius.circular(24.0)
              ),
              color: Theme.of(context).hoverColor,
            ),
            padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 24.0),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Image.asset(
                    //   IconValues.moneyWithWings,
                    //   height: 15,
                    //   width: 15,
                    // ),
                    const Icon(
                      Icons.attach_money,
                      size: 18,
                    ),
                    const SizedBox(width: 8.0),
                    Expanded(
                      child: Text(
                        widget.paymentCount,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 15,
                    ),
                  ],
                ),
                const CommonSeparator(
                  color: Colors.grey,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Expanded(
                      child: Text("Amount"),
                    ),
                    const SizedBox(width: 8.0),
                    Text(widget.amount)
                  ],
                ),
                const SizedBox(height: 8.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Expanded(
                      child: Text("Date"),
                    ),
                    const SizedBox(width: 8.0),
                    Text(widget.date)
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 16.0,
          )
        ],
      )
    );
  }

}