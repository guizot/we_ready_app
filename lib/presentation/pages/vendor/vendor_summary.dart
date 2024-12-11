import 'package:flutter/material.dart';
import 'package:we_ready_app/presentation/core/constant/icon_values.dart';
import 'package:we_ready_app/presentation/pages/home/ceremony_list.dart';
import '../../core/constant/routes_values.dart';
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
                  Image.asset(
                    IconValues.whiteCircle,
                    height: 18,
                    width: 18,
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: Text(
                      widget.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.w600
                      ),
                    )
                  ),
                  const SizedBox(width: 8.0),
                  GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, RoutesValues.ceremonyAdd, arguments: "123");
                      },
                      child: const Icon(
                        Icons.settings,
                        size: 18,
                      )
                  )
                ],
              ),

              const CommonSeparator(
                color: Colors.grey,
              ),

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    IconValues.moneyBag,
                    height: 15,
                    width: 15,
                  ),
                  const SizedBox(width: 8.0),
                  const Expanded(
                    child: Text(
                        "Budget"
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  const Text("Rp 50.000.000")
                ],
              ),
              const SizedBox(height: 8.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    IconValues.chartIncreasing,
                    height: 15,
                    width: 15,
                  ),
                  const SizedBox(width: 8.0),
                  const Expanded(
                    child: Text(
                      "Over Budget"
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  const Text("Rp 50.000.000")
                ],
              ),

              const CommonSeparator(
                color: Colors.grey,
              ),

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    IconValues.checkMarkButton,
                    height: 15,
                    width: 15,
                  ),
                  const SizedBox(width: 8.0),
                  const Expanded(
                    child: Text(
                        "Paid"
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  const Text("Rp 50.000.000")
                ],
              ),
              const SizedBox(height: 8.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    IconValues.crossMark,
                    height: 15,
                    width: 15,
                  ),
                  const SizedBox(width: 8.0),
                  const Expanded(
                    child: Text(
                        "Unpaid"
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  const Text("Rp 50.000.000")
                ],
              ),

              const CommonSeparator(
                color: Colors.grey,
              ),

              const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                        "All Vendor"
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