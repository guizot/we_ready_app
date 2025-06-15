import 'package:flutter/material.dart';
import '../../core/widget/common_separator.dart';

class InvitationSummary extends StatefulWidget {
  const InvitationSummary({super.key, required this.name });
  final String name;

  @override
  State<InvitationSummary> createState() => _InvitationSummaryState();
}

class _InvitationSummaryState extends State<InvitationSummary> {

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
                    Icons.groups_rounded,
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
                  // Image.asset(
                  //   IconValues.envelope,
                  //   height: 15,
                  //   width: 15,
                  // ),
                  Icon(
                    Icons.mail,
                    size: 18,
                  ),
                  SizedBox(width: 8.0),
                  Expanded(
                    child: Text(
                        "Invitation"
                    ),
                  ),
                  SizedBox(width: 8.0),
                  Text("150 Mails")
                ],
              ),
              const SizedBox(height: 8.0),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Image.asset(
                  //   IconValues.familyManWomanBoy,
                  //   height: 15,
                  //   width: 15,
                  // ),
                  Icon(
                    Icons.people_alt_rounded,
                    size: 18,
                  ),
                  SizedBox(width: 8.0),
                  Expanded(
                    child: Text(
                      "Total"
                    ),
                  ),
                  SizedBox(width: 8.0),
                  Text("300 Peoples")
                ],
              ),

              const CommonSeparator(
                color: Colors.grey,
              ),

              const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Image.asset(
                  //   IconValues.largeGreenCircle,
                  //   height: 15,
                  //   width: 15,
                  // ),
                  Icon(
                    Icons.contact_page,
                    size: 18,
                  ),
                  SizedBox(width: 8.0),
                  Expanded(
                    child: Text(
                        "Confirmed"
                    ),
                  ),
                  SizedBox(width: 8.0),
                  Text("25")
                ],
              ),
              const SizedBox(height: 8.0),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Image.asset(
                  //   IconValues.whiteCircle,
                  //   height: 15,
                  //   width: 15,
                  // ),
                  Icon(
                    Icons.contact_page_outlined,
                    size: 18,
                  ),
                  SizedBox(width: 8.0),
                  Expanded(
                    child: Text(
                        "Unconfirmed"
                    ),
                  ),
                  SizedBox(width: 8.0),
                  Text("125")
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