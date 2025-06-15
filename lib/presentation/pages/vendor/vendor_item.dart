import 'package:flutter/material.dart';
import 'package:we_ready_app/presentation/core/constant/routes_values.dart';
import '../../core/widget/add_item.dart';
import '../../core/widget/common_separator.dart';
import '../../core/widget/dashed_container.dart';

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
        Navigator.pushNamed(context, RoutesValues.vendorAdd, arguments: widget.vendorName);
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
                    //   widget.icon,
                    //   height: 15,
                    //   width: 15,
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
                const SizedBox(height: 16.0),
                GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, RoutesValues.payment);
                    },
                    child: DashedBorderContainer(
                      borderColor: Colors.grey,
                      borderWidth: 0.5,
                      borderRadius: 20.0,
                      child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 18.0),
                          child: const Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "See Payments"
                                )
                              ),
                              SizedBox(width: 8.0),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 15,
                              ),
                            ],
                          )
                      ),
                    )
                )
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