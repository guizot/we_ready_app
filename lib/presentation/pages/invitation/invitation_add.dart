import 'package:flutter/material.dart';

import '../../core/constant/form_type.dart';
import '../../core/handler/dialog_handler.dart';
import '../../core/widget/LoadingState.dart';
import '../../core/widget/text_field_item.dart';

class InvitationAdd extends StatefulWidget {
  const InvitationAdd({super.key, this.id});
  final String? id;
  @override
  State<InvitationAdd> createState() => _InvitationAddState();
}

class _InvitationAddState extends State<InvitationAdd> {

  TextEditingController nameController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController packageController = TextEditingController();
  TextEditingController confirmController = TextEditingController();
  bool isLoading = true;

  Map<String, String> populateForm() {
    return {
      'name': nameController.text,
      'category': categoryController.text,
      'package': packageController.text,
      'confirm': confirmController.text,
    };
  }

  Map<String, String> getForm() {
    return {
      'name': 'Tom Cruise',
      'category': 'Friends',
      'package': '150',
      'confirm': 'true',
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
          packageController.text = data['package'] ?? '';
          confirmController.text = data['confirm'] ?? '';
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
    if (formData['package']!.trim().isEmpty) {
      DialogHandler.showSnackBar(context: context, message: "Package cannot be empty");
      return;
    }
    if (formData['confirm']!.trim().isEmpty) {
      DialogHandler.showSnackBar(context: context, message: "Confirmation cannot be empty");
      return;
    }
    DialogHandler.showSnackBar(context: context, message: "Form submitted: $formData");
  }

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
                      title: "Package",
                      inputType: TextInputType.number,
                      preText: "Pax",
                      controller: packageController,
                    ),
                    TextFieldItem(
                      title: "Confirmation",
                      formType: FormType.switcher,
                      controller: confirmController,
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