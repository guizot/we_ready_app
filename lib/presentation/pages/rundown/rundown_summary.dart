import 'package:flutter/material.dart';
import '../../core/widget/common_separator.dart';

class RundownSummary extends StatefulWidget {
  const RundownSummary({super.key, this.summary});
  final Map<String, dynamic>? summary;

  @override
  State<RundownSummary> createState() => _RundownSummaryState();
}

class _RundownSummaryState extends State<RundownSummary> {

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
                  // Image.asset(
                  //   IconValues.whiteCircle,
                  //   height: 18,
                  //   width: 18,
                  // ),
                  Icon(
                    Icons.timelapse,
                    size: 18,
                  ),
                  SizedBox(width: 8.0),
                  Expanded(
                    child: Text(
                      "Rundown Summary",
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
                    Icons.timeline_rounded,
                    size: 18,
                  ),
                  const SizedBox(width: 8.0),
                  const Expanded(
                    child: Text(
                        "Session"
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Text(widget.summary?['sessions'])
                ],
              ),
              const SizedBox(height: 8.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.hourglass_bottom_rounded,
                    size: 18,
                  ),
                  const SizedBox(width: 8.0),
                  const Expanded(
                    child: Text(
                        "Total Hours"
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Text(widget.summary?['totalHours'])
                ],
              ),
              const SizedBox(height: 8.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.calendar_month,
                    size: 18,
                  ),
                  const SizedBox(width: 8.0),
                  const Expanded(
                    child: Text(
                        "Total Days"
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Text(widget.summary?['totalDays'])
                ],
              ),

              const CommonSeparator(
                color: Colors.grey,
              ),

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.alarm_on,
                    size: 18,
                  ),
                  const SizedBox(width: 8.0),
                  const Expanded(
                    child: Text(
                        "Start At"
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Text(widget.summary?['startAt'])
                ],
              ),
              const SizedBox(height: 8.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.alarm_off,
                    size: 18,
                  ),
                  const SizedBox(width: 8.0),
                  const Expanded(
                    child: Text(
                        "End At"
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Text(widget.summary?['endAt'])
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