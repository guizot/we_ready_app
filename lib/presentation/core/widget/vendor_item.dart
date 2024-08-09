import 'package:flutter/material.dart';

import 'dashed_separator.dart';

class VendorItem extends StatefulWidget {
  const VendorItem({super.key, required this.vendorName, required this.vendorType, required this.amount });
  final String vendorName;
  final String vendorType;
  final String amount;

  @override
  State<VendorItem> createState() => _VendorItemState();
}

class _VendorItemState extends State<VendorItem> {

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
                    size: 15,
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
                  const SizedBox(width: 8.0),
                  const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 15,
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              const DashedSeparator(
                color: Colors.grey,
              ),
              const SizedBox(height: 16.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(widget.vendorType),
                  ),
                  const SizedBox(width: 8.0),
                  Text(widget.amount)
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