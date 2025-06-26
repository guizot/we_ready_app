import 'dart:math';

import 'package:flutter/material.dart';

import '../../core/widget/text_field_item.dart';

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
          actions: widget.id == null ? null : [
            Container(
              margin: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                icon: const Icon(Icons.delete_forever_rounded),
                tooltip: 'Delete',
                onPressed: () { },
              ),
            )
          ],
        ),
        body: Column(
          children: [
            Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(16.0),
                  children: const [
                    TextFieldItem(
                        title: "Name"
                    ),
                    TextFieldItem(
                        title: "Category"
                    ),
                    TextFieldItem(
                      title: "Budget",
                      inputType: TextInputType.number,
                      preText: "Rp"
                    ),
                  ],
                )
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              width: double.infinity,
              child: FilledButton(
                onPressed: () {},
                style: FilledButton.styleFrom(
                  backgroundColor: Theme.of(context).iconTheme.color,
                  padding: const EdgeInsets.all(16.0),
                ),
                child: Text(widget.id == null ? "Submit" : "Save"),
              ),
            ),
          ],
        ),
    );
  }

}