import 'package:flutter/material.dart';

class CeremonyItem extends StatefulWidget {
  const CeremonyItem({super.key, required this.name, required this.isSelected });
  final String name;
  final bool isSelected;

  @override
  State<CeremonyItem> createState() => _CeremonyItemState();
}

class _CeremonyItemState extends State<CeremonyItem> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {

      },
      child: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                  Radius.circular(24.0)
              ),
              color: Theme.of(context).hoverColor,
            ),
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        widget.name,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    widget.isSelected ? Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          shape: BoxShape.circle
                      ),
                      padding: const EdgeInsets.all(4.0),
                      child: const Icon(
                        Icons.check,
                        size: 18,
                      ),
                    ) : Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.surfaceDim,
                          shape: BoxShape.circle
                      ),
                      padding: const EdgeInsets.all(4.0),
                      child: const Icon(
                        Icons.check,
                        size: 18,
                        color: Colors.transparent,
                      ),
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
      )
    );
  }

}