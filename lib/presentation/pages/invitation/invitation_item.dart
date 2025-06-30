import 'package:flutter/material.dart';
import 'package:we_ready_app/presentation/core/widget/common_separator.dart';
import '../../../data/models/local/invitation_model.dart';

class InvitationItem extends StatefulWidget {
  const InvitationItem({super.key, required this.item, required this.onTap });
  final Invitation item;
  final Function(String) onTap;

  @override
  State<InvitationItem> createState() => _InvitationItemState();
}

class _InvitationItemState extends State<InvitationItem> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
    onTap: () => widget.onTap(widget.item.id),
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
                    // Image.asset(
                    //   widget.icon,
                    //   height: 15,
                    //   width: 15,
                    // ),
                    const Icon(
                      Icons.account_circle_rounded,
                      size: 18,
                    ),
                    const SizedBox(width: 8.0),
                    Expanded(
                      child: Row(
                        children: [
                          Text(
                            widget.item.name,
                            style: const TextStyle(
                                fontWeight: FontWeight.w600
                            ),
                          ),
                          const SizedBox(width: 6.0),
                          Text(
                            "(${widget.item.invitationPackage} Pax)",
                          ),
                        ],
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
                            Icon(
                              widget.item.confirm == 'true' ? Icons.check_circle_outline_rounded : Icons.remove_circle_outline_rounded,
                              size: 18,
                            ),
                            const SizedBox(width: 8.0),
                            Text(
                              widget.item.confirm == 'true' ? "Confirmed" : "Unconfirmed",
                            )
                          ],
                        )
                    ),
                    const SizedBox(width: 8.0),
                    Row(
                      children: [
                        // Image.asset(
                        //   widget.iconType,
                        //   height: 15,
                        //   width: 15,
                        // ),
                        // const SizedBox(width: 8.0),
                        Text(widget.item.category)
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