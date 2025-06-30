import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:we_ready_app/presentation/core/constant/form_type.dart';
import '../../core/handler/dialog_handler.dart';
import '../../core/widget/loading_state.dart';
import '../../core/widget/text_field_item.dart';

class RundownAdd extends StatefulWidget {
  const RundownAdd({super.key, this.id});
  final String? id;
  @override
  State<RundownAdd> createState() => _RundownAddState();
}

class _RundownAddState extends State<RundownAdd> {

  TextEditingController nameController = TextEditingController();
  TextEditingController startController = TextEditingController();
  TextEditingController endController = TextEditingController();
  TextEditingController descController = TextEditingController();
  bool isLoading = true;

  Map<String, String> populateForm() {
    return {
      'name': nameController.text,
      'start': startController.text,
      'end': endController.text,
      'description': descController.text,
    };
  }

  Map<String, String> getForm() {
    return {
      'name': 'title 1',
      'start': '27 Jun 2025 - 13:45',
      'end': '28 Jun 2025 - 13:45',
      'description': 'desc 1 \nenter is here',
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
          startController.text = data['start'] ?? '';
          endController.text = data['end'] ?? '';
          descController.text = data['description'] ?? '';
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
    if (formData['start']!.trim().isEmpty) {
      DialogHandler.showSnackBar(context: context, message: "Start Time cannot be empty");
      return;
    }
    if (formData['end']!.trim().isEmpty) {
      DialogHandler.showSnackBar(context: context, message: "End Time cannot be empty");
      return;
    }
    if (formData['description']!.trim().isEmpty) {
      DialogHandler.showSnackBar(context: context, message: "Description cannot be empty");
      return;
    }
    try {
      final dateFormat = DateFormat('dd MMM yyyy - HH:mm');
      final startDate = dateFormat.parse(formData['start']!);
      final endDate = dateFormat.parse(formData['end']!);

      if (endDate.isBefore(startDate)) {
        DialogHandler.showSnackBar(
            context: context,
            message: "End Time cannot be earlier than Start Time");
        return;
      }
    } catch (e) {
      DialogHandler.showSnackBar(context: context, message: "Invalid date format");
      return;
    }
    DialogHandler.showSnackBar(context: context, message: "Form submitted: $formData");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("${widget.id == null ? "Add" : "Edit"} Rundown"),
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
                      title: "Start Time",
                      formType: FormType.date,
                      controller: startController,
                    ),
                    TextFieldItem(
                      title: "End Time",
                      formType: FormType.date,
                      controller: endController,
                    ),
                    TextFieldItem(
                      title: "Description",
                      inputType: TextInputType.multiline,
                      controller: descController,
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