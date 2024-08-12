import 'package:flutter/material.dart';
import 'package:we_ready_app/presentation/core/widget/add_item.dart';
import 'package:we_ready_app/presentation/pages/home/ceremony_item.dart';
import '../../core/handler/dialog_handler.dart';

class CeremonyList extends StatelessWidget {
  const CeremonyList({super.key});

  @override
  Widget build(BuildContext context) {
    return buildChild(context);
  }

  Widget buildChild(BuildContext context) {
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
        AddItem(
          name: "Add Ceremony +",
          onAdd: () {},
        ),
        const CeremonyItem(
          name: "Acara Pernikahan",
          isSelected: true
        ),
        const CeremonyItem(
          name: "Sanjitan",
            isSelected: false
        ),
        const CeremonyItem(
          name: "After Party Day 1",
            isSelected: false
        ),
        const CeremonyItem(
          name: "After Party Day 2",
            isSelected: false
        ),
      ],
    );
  }

  void show(BuildContext context) {
    DialogHandler.showBottomSheet(
        context: context,
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
              width: double.infinity,
              child: build(context)
          ),
        )
    );
  }

}
