import 'package:flutter/material.dart';
import '../../core/widget/common_separator.dart';

class VendorSummary extends StatefulWidget {
  const VendorSummary({super.key, required this.name });
  final String name;

  @override
  State<VendorSummary> createState() => _VendorSummaryState();
}

class _VendorSummaryState extends State<VendorSummary> {

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
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.home,
                    size: 18,
                  ),
                  const SizedBox(width: 8.0),
                  Expanded(
                    child: Text(
                      widget.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.w600
                      ),
                    )
                  ),
                  const SizedBox(width: 8.0),
                ],
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
                    Icons.paid,
                    size: 18,
                  ),
                  SizedBox(width: 8.0),
                  Expanded(
                    child: Text(
                        "Budget"
                    ),
                  ),
                  SizedBox(width: 8.0),
                  Text("Rp 200.000.000")
                ],
              ),
              const SizedBox(height: 8.0),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Image.asset(
                  //   IconValues.chartIncreasing,
                  //   height: 15,
                  //   width: 15,
                  // ),
                  Icon(
                    Icons.paid_outlined,
                    size: 18,
                  ),
                  SizedBox(width: 8.0),
                  Expanded(
                    child: Text(
                      "Over Budget"
                    ),
                  ),
                  SizedBox(width: 8.0),
                  Text("Rp 10.000.000")
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
                  Text("Rp 60.000.000")
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
                  Text("Rp 150.000.000")
                ],
              ),

              const CommonSeparator(
                color: Colors.grey,
              ),

              const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.area_chart,
                    size: 18,
                  ),
                  SizedBox(width: 8.0),

                  Expanded(
                    child: Text(
                        "All Vendor"
                    ),
                  ),
                  SizedBox(width: 8.0),
                  Text("Rp 210.000.000")
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