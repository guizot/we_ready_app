import 'package:flutter/material.dart';
import 'dart:math';

import '../../core/widget/text_field_item.dart';

class InvitationAdd extends StatefulWidget {
  const InvitationAdd({super.key, this.id});
  final String? id;
  @override
  State<InvitationAdd> createState() => _InvitationAddState();
}

class _InvitationAddState extends State<InvitationAdd> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("${widget.id == null ? "Add" : "Edit"} Invitation"),
          backgroundColor: Theme.of(context).colorScheme.surface,
          surfaceTintColor: Colors.transparent,
          centerTitle: true,
          actions: widget.id == null ? null : [
            Container(
              margin: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                icon: Transform.rotate(
                  angle: 45 * pi / 180,
                  child: const Icon(Icons.add_circle_outline_sharp),
                ),
                tooltip: 'Delete',
                onPressed: () { },
              ),
            )
          ],
        ),
        body: ListView(
          padding: const EdgeInsets.all(16.0),
          children: const [
            TextFieldItem(
                title: "Name"
            ),
            TextFieldItem(
                title: "Package"
            ),
            TextFieldItem(
                title: "Category"
            ),
            TextFieldItem(
                title: "Confirmation"
            ),
          ],
        )
    );
  }

}