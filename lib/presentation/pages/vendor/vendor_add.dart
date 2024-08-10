import 'package:flutter/material.dart';

class VendorAdd extends StatefulWidget {
  const VendorAdd({super.key, this.id});
  final String? id;

  @override
  State<VendorAdd> createState() => _VendorAddState();
}

class _VendorAddState extends State<VendorAdd> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("${widget.id == null ? "Add" : "Edit"} Vendor"),
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