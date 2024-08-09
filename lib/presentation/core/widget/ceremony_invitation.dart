import 'package:flutter/material.dart';
import 'package:we_ready_app/presentation/core/constant/icon_values.dart';

import 'dashed_separator.dart';

class CeremonyInvitation extends StatefulWidget {
  const CeremonyInvitation({super.key, required this.ceremonyName });
  final String ceremonyName;

  @override
  State<CeremonyInvitation> createState() => _CeremonyInvitationState();
}

class _CeremonyInvitationState extends State<CeremonyInvitation> {

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
                    IconValues.envelope,
                    height: 15,
                    width: 15,
                  ),
                  const SizedBox(width: 8.0),
                  const Expanded(
                    child: Text(
                        "Invitation"
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  const Text("150")
                ],
              ),
              const SizedBox(height: 8.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    IconValues.familyManWomanBoy,
                    height: 15,
                    width: 15,
                  ),
                  const SizedBox(width: 8.0),
                  const Expanded(
                    child: Text(
                      "Package"
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  const Text("300 Pax")
                ],
              ),

              const DashedSeparator(
                color: Colors.grey,
              ),

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    IconValues.largeGreenCircle,
                    height: 15,
                    width: 15,
                  ),
                  const SizedBox(width: 8.0),
                  const Expanded(
                    child: Text(
                        "Confirmed"
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  const Text("25")
                ],
              ),
              const SizedBox(height: 8.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    IconValues.whiteCircle,
                    height: 15,
                    width: 15,
                  ),
                  const SizedBox(width: 8.0),
                  const Expanded(
                    child: Text(
                        "Unconfirmed"
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  const Text("125")
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