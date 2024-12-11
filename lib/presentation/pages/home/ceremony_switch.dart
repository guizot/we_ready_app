import 'package:flutter/material.dart';
import 'package:we_ready_app/presentation/core/constant/icon_values.dart';
import '../../core/constant/routes_values.dart';
import 'ceremony_list.dart';

class CeremonySwitch extends StatefulWidget {
  const CeremonySwitch({super.key, required this.ceremonyName });
  final String ceremonyName;

  @override
  State<CeremonySwitch> createState() => _CeremonySwitchState();
}

class _CeremonySwitchState extends State<CeremonySwitch> {

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
                  Image.asset(
                    IconValues.partyPopper,
                    height: 18,
                    width: 18,
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => const CeremonyList().show(context),
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
                  ),
                  const SizedBox(width: 8.0),
                  GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, RoutesValues.ceremonyAdd, arguments: "123");
                      },
                      child: const Icon(
                        Icons.settings,
                        size: 18,
                      )
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
    );
  }

}