import 'package:flutter/material.dart';

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
        ),
        body: ListView(
          padding: const EdgeInsets.all(16.0),
          children: const [

          ],
        )
    );
  }

}