import 'package:flutter/material.dart';
import 'package:we_ready_app/presentation/core/constant/routes_values.dart';
import '../../core/widget/common_separator.dart';

class VendorItem extends StatefulWidget {
  const VendorItem({super.key, required this.vendorName, required this.vendorType, required this.amount, required this.icon });
  final String vendorName;
  final String vendorType;
  final String amount;
  final String icon;

  @override
  State<VendorItem> createState() => _VendorItemState();
}

class _VendorItemState extends State<VendorItem> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, RoutesValues.payment);
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
                    Image.asset(
                      widget.icon,
                      height: 15,
                      width: 15,
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
                const CommonSeparator(
                  color: Colors.grey,
                ),
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
      )
    );
  }

}