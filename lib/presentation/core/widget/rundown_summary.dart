import 'package:flutter/material.dart';
import 'package:we_ready_app/presentation/core/constant/icon_values.dart';
import 'package:we_ready_app/presentation/core/widget/rundown_item.dart';

import '../constant/routes_values.dart';
import '../handler/dialog_handler.dart';

class RundownSummary extends StatefulWidget {
  const RundownSummary({super.key, required this.ceremonyName });
  final String ceremonyName;

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
                  Image.asset(
                    IconValues.partyPopper,
                    height: 18,
                    width: 18,
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        DialogHandler.showBottomSheet(
                            context: context,
                            child: Container(
                              padding: const EdgeInsets.all(16.0),
                              child: const SizedBox(
                                  width: double.infinity,
                                  child: RundownItem(
                                    time: "09:00",
                                    timeAmount: "1 Jam 30 Menit",
                                    icon: IconValues.megaphone,
                                    title: "Sungkeman Keluarga Groom",
                                    subtitle: "Proses sungkeman dengan keluarga groom di ruangan Alila",
                                  ),
                              ),
                            )
                        );
                      },
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