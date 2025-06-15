import 'package:flutter/material.dart';
import '../../core/constant/icon_values.dart';
import '../../core/constant/routes_values.dart';
import '../../core/widget/common_separator.dart';

class RundownItem extends StatefulWidget {
  const RundownItem({super.key, required this.time, required this.timeAmount, required this.icon, required this.title, required this.subtitle });
  final String time;
  final String timeAmount;
  final String icon;
  final String title;
  final String subtitle;

  @override
  State<RundownItem> createState() => _RundownItemState();
}

class _RundownItemState extends State<RundownItem> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, RoutesValues.rundownAdd, arguments: "123");
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
                    //   IconValues.hourglassDone,
                    //   height: 15,
                    //   width: 15,
                    // ),
                    const Icon(
                      Icons.access_time_filled_rounded,
                      size: 18,
                    ),
                    const SizedBox(width: 8.0),
                    Expanded(
                      child: Row(
                        children: [
                          Text(
                            widget.time,
                            style: const TextStyle(
                                fontWeight: FontWeight.w600
                            ),
                          ),
                          const SizedBox(width: 6.0),
                          Text(
                            "(${widget.timeAmount})",
                          ),
                        ],
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
                Column(
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
                          Icons.arrow_circle_right_outlined,
                          size: 18,
                        ),
                        const SizedBox(width: 8.0),
                        Expanded(
                          child: Text(
                            widget.title,
                            style: const TextStyle(
                                fontWeight: FontWeight.w600
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4.0),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(width: 28.0),
                        Expanded(
                          child: Text(
                            widget.subtitle,
                          ),
                        ),
                      ],
                    )
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