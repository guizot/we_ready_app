import 'package:flutter/material.dart';
import '../../core/handler/dialog_handler.dart';
import '../../core/widget/LoadingState.dart';
import '../../core/widget/text_field_item.dart';

class VendorAdd extends StatefulWidget {
  const VendorAdd({super.key, this.id});
  final String? id;

  @override
  State<VendorAdd> createState() => _VendorAddState();
}

class _VendorAddState extends State<VendorAdd> {

  TextEditingController nameController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController budgetController = TextEditingController();
  bool isLoading = true;

  Map<String, String> populateForm() {
    return {
      'name': nameController.text,
      'category': categoryController.text,
      'budget': budgetController.text,
    };
  }

  Map<String, String> getForm() {
    return {
      'name': 'name vendor 1',
      'category': 'Gaun Baju',
      'budget': '2500000',
    };
  }

  @override
  void initState() {
    super.initState();
    if (widget.id != null) {
      Future.delayed(const Duration(milliseconds: 500), () {
        final data = getForm();
        setState(() {
          nameController.text = data['name'] ?? '';
          categoryController.text = data['category'] ?? '';
          budgetController.text = data['budget'] ?? '';
          isLoading = false;
        });
      });
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }

  void onSubmit() {
    final formData = populateForm();
    if (formData['name']!.trim().isEmpty) {
      DialogHandler.showSnackBar(context: context, message: "Name cannot be empty");
      return;
    }
    if (formData['category']!.trim().isEmpty) {
      DialogHandler.showSnackBar(context: context, message: "Category cannot be empty");
      return;
    }
    if (formData['budget']!.trim().isEmpty) {
      DialogHandler.showSnackBar(context: context, message: "Budget cannot be empty");
      return;
    }
    DialogHandler.showSnackBar(context: context, message: "Form submitted: $formData");
  }

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
        body: isLoading ? const LoadingState() : Column(
          children: [
            Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(16.0),
                  children: [
                    TextFieldItem(
                      title: "Name",
                      controller: nameController,
                    ),
                    TextFieldItem(
                      title: "Category",
                      controller: categoryController,
                    ),
                    TextFieldItem(
                      title: "Budget",
                      inputType: TextInputType.number,
                      preText: "Rp",
                      controller: budgetController,
                    ),
                  ],
                )
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              width: double.infinity,
              child: FilledButton(
                onPressed: onSubmit,
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