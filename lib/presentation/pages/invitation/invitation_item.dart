import 'package:flutter/material.dart';
import 'package:we_ready_app/presentation/core/widget/common_separator.dart';
import '../../core/constant/routes_values.dart';

class InvitationItem extends StatefulWidget {
  const InvitationItem({super.key, required this.name, required this.pax, required this.isConfirmed, required this.invitationType, required this.icon, required this.iconType });
  final String name;
  final int pax;
  final bool isConfirmed;
  final String invitationType;
  final String icon;
  final String iconType;

  @override
  State<InvitationItem> createState() => _InvitationItemState();
}

class _InvitationItemState extends State<InvitationItem> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, RoutesValues.invitationAdd, arguments: "123");
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
            padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 24.0),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      widget.icon,
                      height: 15,
                      width: 15,
                    ),
                    const SizedBox(width: 8.0),
                    Expanded(
                      child: Text(
                        "${widget.name} (${widget.pax} Pax)",
                        style: const TextStyle(
                            fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 15,
                    ),
                  ],
                ),
                const CommonSeparator(
                  color: Colors.grey,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: Row(
                          children: [
                            Container(
                                padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12.0),
                                decoration: BoxDecoration(
                                    color: widget.isConfirmed ? Theme.of(context).colorScheme.inversePrimary : Theme.of(context).colorScheme.surfaceDim,
                                    borderRadius: const BorderRadius.all(Radius.circular(25.0))
                                ),
                                child: Text(
                                  widget.isConfirmed ? "Confirmed" : "Unconfirmed",
                                  style: const TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w600
                                  ),
                                )
                            )
                          ],
                        )
                    ),
                    const SizedBox(width: 8.0),
                    Row(
                      children: [
                        Image.asset(
                          widget.iconType,
                          height: 15,
                          width: 15,
                        ),
                        const SizedBox(width: 8.0),
                        Text(widget.invitationType)
                      ],
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