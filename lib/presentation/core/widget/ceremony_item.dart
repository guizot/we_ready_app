import 'package:flutter/material.dart';

import 'dashed_separator.dart';

class CeremonyItem extends StatefulWidget {
  const CeremonyItem({super.key, required this.ceremonyName });
  final String ceremonyName;

  @override
  State<CeremonyItem> createState() => _CeremonyItemState();
}

class _CeremonyItemState extends State<CeremonyItem> {

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
                    Icons.auto_fix_high_sharp,
                    size: 18,
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

              const SizedBox(height: 16.0),
              const DashedSeparator(
                color: Colors.grey,
              ),
              const SizedBox(height: 16.0),

              const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.attach_money,
                    size: 15,
                  ),
                  SizedBox(width: 8.0),
                  Expanded(
                    child: Text(
                        "Budget"
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
                  Icon(
                    Icons.money_off,
                    size: 15,
                  ),
                  SizedBox(width: 8.0),
                  Expanded(
                    child: Text(
                      "Over Budget"
                    ),
                  ),
                  SizedBox(width: 8.0),
                  Text("Rp 50.000.000")
                ],
              ),

              const SizedBox(height: 16.0),
              const DashedSeparator(
                color: Colors.grey,
              ),
              const SizedBox(height: 16.0),

              const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.keyboard_double_arrow_up_sharp,
                    size: 15,
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
                  Icon(
                    Icons.keyboard_double_arrow_down_sharp,
                    size: 15,
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

              const SizedBox(height: 16.0),
              const DashedSeparator(
                color: Colors.grey,
              ),
              const SizedBox(height: 16.0),

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