import 'package:flutter/material.dart';
import '../../core/widget/common_separator.dart';

class RundownSummary extends StatefulWidget {
  const RundownSummary({super.key, required this.name });
  final String name;

  @override
  State<RundownSummary> createState() => _RundownSummaryState();
}

class _RundownSummaryState extends State<RundownSummary> {

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
                  // Image.asset(
                  //   IconValues.whiteCircle,
                  //   height: 18,
                  //   width: 18,
                  // ),
                  const Icon(
                    Icons.timelapse,
                    size: 18,
                  ),
                  const SizedBox(width: 8.0),
                  Expanded(
                    child: Text(
                      widget.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600
                      ),
                    )
                  ),
                  const SizedBox(width: 8.0),
                ],
              ),

              const CommonSeparator(
                color: Colors.grey,
              ),

              const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.timeline_rounded,
                    size: 18,
                  ),
                  SizedBox(width: 8.0),
                  Expanded(
                    child: Text(
                        "Session"
                    ),
                  ),
                  SizedBox(width: 8.0),
                  Text("7 Sessions")
                ],
              ),
              const SizedBox(height: 8.0),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.hourglass_bottom_rounded,
                    size: 18,
                  ),
                  SizedBox(width: 8.0),
                  Expanded(
                    child: Text(
                        "Total Hours"
                    ),
                  ),
                  SizedBox(width: 8.0),
                  Text("10 Hr 45 Min")
                ],
              ),
              const SizedBox(height: 8.0),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.calendar_month,
                    size: 18,
                  ),
                  SizedBox(width: 8.0),
                  Expanded(
                    child: Text(
                        "Total Days"
                    ),
                  ),
                  SizedBox(width: 8.0),
                  Text("2 Days")
                ],
              ),

              const CommonSeparator(
                color: Colors.grey,
              ),

              const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.alarm_on,
                    size: 18,
                  ),
                  SizedBox(width: 8.0),
                  Expanded(
                    child: Text(
                        "Start At"
                    ),
                  ),
                  SizedBox(width: 8.0),
                  Text("24 Sep 10:30")
                ],
              ),
              const SizedBox(height: 8.0),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.alarm_off,
                    size: 18,
                  ),
                  SizedBox(width: 8.0),
                  Expanded(
                    child: Text(
                        "End At"
                    ),
                  ),
                  SizedBox(width: 8.0),
                  Text("25 Sep 13:00")
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