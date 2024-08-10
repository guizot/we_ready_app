import 'package:flutter/material.dart';

class RundownAdd extends StatefulWidget {
  const RundownAdd({super.key, this.id});
  final String? id;
  @override
  State<RundownAdd> createState() => _RundownAddState();
}

class _RundownAddState extends State<RundownAdd> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("${widget.id == null ? "Add" : "Edit"} Rundown"),
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