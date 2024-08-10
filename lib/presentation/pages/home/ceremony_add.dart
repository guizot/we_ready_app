import 'package:flutter/material.dart';

class CeremonyAdd extends StatefulWidget {
  const CeremonyAdd({super.key, this.id});
  final String? id;
  @override
  State<CeremonyAdd> createState() => _CeremonyAddState();
}

class _CeremonyAddState extends State<CeremonyAdd> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("${widget.id == null ? "Add" : "Edit"} Ceremony"),
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