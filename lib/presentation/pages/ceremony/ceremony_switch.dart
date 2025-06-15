import 'package:flutter/material.dart';
import '../../core/constant/routes_values.dart';
import '../../core/handler/dialog_handler.dart';
import 'ceremony_list.dart';

class CeremonySwitch extends StatefulWidget {
  const CeremonySwitch({super.key, required this.ceremonyName });
  final String ceremonyName;

  @override
  State<CeremonySwitch> createState() => _CeremonySwitchState();
}

class _CeremonySwitchState extends State<CeremonySwitch> {

  void ceremonyList(BuildContext context) {
    DialogHandler.showBottomSheet(
        context: context,
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
              width: double.infinity,
              child: CeremonyList(
                onAdd: () => ceremonyAdd(context),
                onEdit: (String id) => ceremonyEdit(context, id)
              )
          ),
        )
    );
  }

  void ceremonyAdd(BuildContext context) {
    Navigator.popAndPushNamed(context, RoutesValues.ceremonyAdd);
  }

  void ceremonyEdit(BuildContext context, String id) {
    Navigator.popAndPushNamed(context, RoutesValues.ceremonyAdd, arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => ceremonyList(context),
          child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                    Radius.circular(24.0)
                ),
                color: Theme.of(context).hoverColor,
              ),
              padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 24.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Image.asset(
                  //   IconValues.partyPopper,
                  //   height: 18,
                  //   width: 18,
                  // ),
                  const Icon(
                    Icons.list_alt_rounded,
                    size: 18,
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: Text(
                      widget.ceremonyName,
                      style: const TextStyle(
                          fontWeight: FontWeight.w600
                      ),
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  const Icon(
                    Icons.keyboard_arrow_down_sharp,
                    size: 24,
                  )
                ],
              )
          )
        ),
        const SizedBox(
          height: 16.0,
        )
      ],
    );
  }

}