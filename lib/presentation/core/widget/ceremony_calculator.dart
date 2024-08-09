import 'package:flutter/material.dart';
import 'package:we_ready_app/presentation/core/constant/icon_values.dart';

import 'dashed_separator.dart';

class CeremonyCalculator extends StatefulWidget {
  const CeremonyCalculator({super.key, required this.ceremonyName });
  final String ceremonyName;

  @override
  State<CeremonyCalculator> createState() => _CeremonyCalculatorState();
}

class _CeremonyCalculatorState extends State<CeremonyCalculator> {

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
                    Image.asset(
                      IconValues.partyPopper,
                      height: 18,
                      width: 18,
                    ),
                    const SizedBox(width: 16.0),
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            widget.ceremonyName,
                            style: const TextStyle(
                                fontWeight: FontWeight.w600
                            ),
                          ),
                          const SizedBox(width: 4.0),
                          const Icon(
                            Icons.keyboard_arrow_down_sharp,
                            size: 18,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    const Icon(
                      Icons.settings,
                      size: 18,
                    ),
                  ],
                ),
              ),

              const DashedSeparator(
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

              const DashedSeparator(
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

              const DashedSeparator(
                color: Colors.grey,
              ),

              const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                        "Calculated Vendor"
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