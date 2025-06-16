import 'package:flutter/material.dart';
import '../../core/constant/routes_values.dart';
import '../../core/handler/dialog_handler.dart';
import 'event_list.dart';

class EventSwitch extends StatefulWidget {
  const EventSwitch({super.key, required this.eventName });
  final String eventName;

  @override
  State<EventSwitch> createState() => _EventSwitchState();
}

class _EventSwitchState extends State<EventSwitch> {

  void eventList(BuildContext context) {
    DialogHandler.showBottomSheet(
        context: context,
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
              width: double.infinity,
              child: EventList(
                onAdd: () => eventAdd(context),
                onEdit: (String id) => eventEdit(context, id)
              )
          ),
        )
    );
  }

  void eventAdd(BuildContext context) {
    Navigator.popAndPushNamed(context, RoutesValues.eventAdd);
  }

  void eventEdit(BuildContext context, String id) {
    Navigator.popAndPushNamed(context, RoutesValues.eventAdd, arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => eventList(context),
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
                      widget.eventName,
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