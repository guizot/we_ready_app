import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../data/models/local/rundown_model.dart';
import '../../core/widget/common_separator.dart';

class RundownItem extends StatefulWidget {
  const RundownItem({super.key, required this.item, required this.onTap });
  final Rundown item;
  final Function(String) onTap;

  @override
  State<RundownItem> createState() => _RundownItemState();
}

class _RundownItemState extends State<RundownItem> {

  @override
  Widget build(BuildContext context) {

    DateFormat format = DateFormat('dd MMM yyyy - HH:mm');
    DateTime startTime = format.parse(widget.item.start);
    DateTime endTime = format.parse(widget.item.end);

    // Date
    String dateRange = "";
    if (startTime.year == endTime.year) {
      if (startTime.month == endTime.month && startTime.day == endTime.day) {
        dateRange = DateFormat('dd MMM yyyy').format(startTime);
      } else {
        dateRange = "${DateFormat('dd MMM').format(startTime)} - ${DateFormat('dd MMM yyyy').format(endTime)}";
      }
    } else {
      dateRange = "${DateFormat('dd MMM yyyy').format(startTime)} - ${DateFormat('dd MMM yyyy').format(endTime)}";
    }

    // Time
    String timeRange = "${DateFormat('HH:mm').format(startTime)} - ${DateFormat('HH:mm').format(endTime)}";

    // Duration
    Duration duration = endTime.difference(startTime);
    int hours = duration.inHours;
    int minutes = duration.inMinutes.remainder(60);
    String durationText = "($hours Hr $minutes Min)";

    return GestureDetector(
      onTap: () => widget.onTap(widget.item.id),
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
                    const Icon(
                      Icons.calendar_month,
                      size: 18,
                    ),
                    const SizedBox(width: 8.0),
                    Expanded(
                      child: Text(
                        dateRange,
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
                const SizedBox(height: 8.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.access_time_filled_rounded,
                      size: 18,
                    ),
                    const SizedBox(width: 8.0),
                    Expanded(
                      child: Row(
                        children: [
                          Text(
                            timeRange,
                            style: const TextStyle(
                                fontWeight: FontWeight.w600
                            ),
                          ),
                          const SizedBox(width: 6.0),
                          Text(
                            durationText,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const CommonSeparator(
                  color: Colors.grey,
                ),
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
                        widget.item.name,
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
                        widget.item.description,
                      ),
                    ),
                  ],
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