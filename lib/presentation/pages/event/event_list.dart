import 'package:flutter/material.dart';
import 'package:we_ready_app/presentation/core/widget/add_item.dart';

import 'event_item.dart';

class EventList extends StatelessWidget {
  const EventList({super.key, required this.onAdd, required this.onEdit });
  final Function onAdd;
  final Function(String) onEdit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 5.0,
          width: MediaQuery.of(context).size.width / 4,
          decoration: BoxDecoration(
              color: Theme.of(context).hoverColor,
              borderRadius: const BorderRadius.all(Radius.circular(25.0))
          ),
        ),
        const SizedBox(height: 24.0),
        EventItem(
            name: "Acara Pernikahan",
            isSelected: true,
            onEdit: onEdit
        ),
        EventItem(
            name: "Sangjitan",
            isSelected: false,
            onEdit: onEdit
        ),
        EventItem(
            name: "After Party",
            isSelected: false,
            onEdit: onEdit
        ),
        AddItem(
            name: "Add Event +",
            onAdd: onAdd
        ),
      ],
    );
  }

}
