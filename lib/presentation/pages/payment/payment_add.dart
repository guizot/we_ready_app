import 'package:flutter/material.dart';
import '../../core/constant/form_type.dart';
import '../../core/handler/dialog_handler.dart';
import '../../core/widget/LoadingState.dart';
import '../../core/widget/text_field_item.dart';

class PaymentAdd extends StatefulWidget {
  const PaymentAdd({super.key, this.id});
  final String? id;
  @override
  State<PaymentAdd> createState() => _PaymentAddState();
}

class _PaymentAddState extends State<PaymentAdd> {

  TextEditingController nameController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  bool isLoading = true;

  Map<String, String> populateForm() {
    return {
      'name': nameController.text,
      'amount': amountController.text,
      'date': dateController.text,
    };
  }

  Map<String, String> getForm() {
    return {
      'name': 'title 1',
      'amount': 'desc 1 \nenter is here',
      'date': '27 Jun 2025 - 13:45',
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
          amountController.text = data['amount'] ?? '';
          dateController.text = data['date'] ?? '';
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
    if (formData['amount']!.trim().isEmpty) {
      DialogHandler.showSnackBar(context: context, message: "Amount cannot be empty");
      return;
    }
    if (formData['date']!.trim().isEmpty) {
      DialogHandler.showSnackBar(context: context, message: "Date Time cannot be empty");
      return;
    }
    DialogHandler.showSnackBar(context: context, message: "Form submitted: $formData");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("${widget.id == null ? "Add" : "Edit"} Payment"),
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
                      title: "Amount",
                      inputType: TextInputType.number,
                      preText: "Rp",
                      controller: amountController,
                    ),
                    TextFieldItem(
                      title: "Date Time",
                      formType: FormType.date,
                      controller: dateController,
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