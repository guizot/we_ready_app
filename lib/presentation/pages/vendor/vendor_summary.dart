import 'package:flutter/material.dart';
import '../../core/widget/common_separator.dart';

class VendorSummary extends StatefulWidget {
  const VendorSummary({super.key, this.summary});
  final Map<String, dynamic>? summary;

  @override
  State<VendorSummary> createState() => _VendorSummaryState();
}

class _VendorSummaryState extends State<VendorSummary> {

  @override
  Widget build(BuildContext context) {
    return widget.summary != null ? Column(
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
              const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.home,
                    size: 18,
                  ),
                  SizedBox(width: 8.0),
                  Expanded(
                    child: Text(
                      "Vendor Summary",
                      style: TextStyle(
                          fontWeight: FontWeight.w600
                      ),
                    )
                  ),
                  SizedBox(width: 8.0),
                ],
              ),

              const CommonSeparator(
                color: Colors.grey,
              ),

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.paid,
                    size: 18,
                  ),
                  const SizedBox(width: 8.0),
                  const Expanded(
                    child: Text(
                        "Budget"
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Text(widget.summary?['budget'])
                ],
              ),
              const SizedBox(height: 8.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.paid_outlined,
                    size: 18,
                  ),
                  const SizedBox(width: 8.0),
                  const Expanded(
                    child: Text(
                      "Unused Budget"
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Text(widget.summary?['unusedBudget'])
                ],
              ),
              const SizedBox(height: 8.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.money_off_rounded,
                    size: 18,
                  ),
                  const SizedBox(width: 8.0),
                  const Expanded(
                    child: Text(
                        "Over Budget"
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Text(widget.summary?['overBudget'])
                ],
              ),

              const CommonSeparator(
                color: Colors.grey,
              ),

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Image.asset(
                  //   IconValues.checkMarkButton,
                  //   height: 15,
                  //   width: 15,
                  // ),
                  const Icon(
                    Icons.check_circle,
                    size: 18,
                  ),
                  const SizedBox(width: 8.0),
                  const Expanded(
                    child: Text(
                        "Paid"
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Text(widget.summary?['paid'])
                ],
              ),
              const SizedBox(height: 8.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Image.asset(
                  //   IconValues.crossMark,
                  //   height: 15,
                  //   width: 15,
                  // ),
                  const Icon(
                    Icons.check_circle_outline,
                    size: 18,
                  ),
                  const SizedBox(width: 8.0),
                  const Expanded(
                    child: Text(
                        "Unpaid"
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Text(widget.summary?['unpaid'])
                ],
              ),
              const SizedBox(height: 8.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.money_off_rounded,
                    size: 18,
                  ),
                  const SizedBox(width: 8.0),
                  const Expanded(
                    child: Text(
                        "Over Paid"
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Text(widget.summary?['overPaid'])
                ],
              ),

              const CommonSeparator(
                color: Colors.grey,
              ),

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.area_chart,
                    size: 18,
                  ),
                  const SizedBox(width: 8.0),

                  const Expanded(
                    child: Text(
                        "All Vendor"
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Text(widget.summary?['total'])
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 16.0,
        )
      ],
    ) : Container();
  }

}