import 'package:flutter/material.dart';
import 'package:we_ready_app/presentation/core/constant/icon_values.dart';
import '../../core/constant/routes_values.dart';
import '../../core/widget/common_separator.dart';

class PaymentSummary extends StatefulWidget {
  const PaymentSummary({super.key, required this.vendorName });
  final String vendorName;

  @override
  State<PaymentSummary> createState() => _PaymentSummaryState();
}

class _PaymentSummaryState extends State<PaymentSummary> {

  @override
  Widget build(BuildContext context) {
    return Column(
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
              GestureDetector(
                onTap: () {},
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Image.asset(
                    //   IconValues.partyPopper,
                    //   height: 18,
                    //   width: 18,
                    // ),
                    const Icon(
                      Icons.arrow_circle_right,
                      size: 18,
                    ),
                    const SizedBox(width: 8.0),
                    Expanded(
                      child: Text(
                        widget.vendorName,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                    const SizedBox(width: 8.0)
                  ],
                ),
              ),

              const CommonSeparator(
                color: Colors.grey,
              ),

              const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Image.asset(
                  //   IconValues.moneyBag,
                  //   height: 15,
                  //   width: 15,
                  // ),
                  Icon(
                    Icons.price_change_rounded,
                    size: 18,
                  ),
                  SizedBox(width: 8.0),
                  Expanded(
                    child: Text(
                        "Price"
                    ),
                  ),
                  SizedBox(width: 8.0),
                  Text("Rp 50.000.000")
                ],
              ),
              const SizedBox(height: 8.0),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Image.asset(
                  //   IconValues.pageFacingUp,
                  //   height: 15,
                  //   width: 15,
                  // ),
                  Icon(
                    Icons.list_alt_rounded,
                    size: 18,
                  ),
                  SizedBox(width: 8.0),
                  Expanded(
                    child: Text(
                      "Type"
                    ),
                  ),
                  SizedBox(width: 8.0),
                  Text("Wedding Organizer")
                ],
              ),

              const CommonSeparator(
                color: Colors.grey,
              ),

              const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Image.asset(
                  //   IconValues.checkMarkButton,
                  //   height: 15,
                  //   width: 15,
                  // ),
                  Icon(
                    Icons.check_circle,
                    size: 18,
                  ),
                  SizedBox(width: 8.0),
                  Expanded(
                    child: Text(
                        "Paid"
                    ),
                  ),
                  SizedBox(width: 8.0),
                  Text("Rp 50.000.000")
                ],
              ),
              const SizedBox(height: 8.0),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Image.asset(
                  //   IconValues.crossMark,
                  //   height: 15,
                  //   width: 15,
                  // ),
                  Icon(
                    Icons.check_circle_outline,
                    size: 18,
                  ),
                  SizedBox(width: 8.0),
                  Expanded(
                    child: Text(
                        "Unpaid"
                    ),
                  ),
                  SizedBox(width: 8.0),
                  Text("Rp 50.000.000")
                ],
              ),

            ],
          ),
        ),
        const SizedBox(
          height: 16.0,
        )
      ],
    );
  }

}