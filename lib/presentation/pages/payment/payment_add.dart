import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';
import 'package:we_ready_app/presentation/core/extension/number_extension.dart';
import '../../../data/models/local/payment_model.dart';
import '../../../injector.dart';
import '../../core/constant/form_type.dart';
import '../../core/handler/dialog_handler.dart';
import '../../core/model/payment_args.dart';
import '../../core/widget/loading_state.dart';
import '../../core/widget/text_field_item.dart';
import 'cubit/payment_state.dart';
import 'cubit/peyment_cubit.dart';

class PaymentAddProvider extends StatelessWidget {
  const PaymentAddProvider({super.key, required this.item });
  final PaymentArgs item;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<PaymentCubit>(),
      child: PaymentAdd(item: item),
    );
  }
}

class PaymentAdd extends StatefulWidget {
  const PaymentAdd({super.key, required this.item});
  final PaymentArgs item;
  @override
  State<PaymentAdd> createState() => _PaymentAddState();
}

class _PaymentAddState extends State<PaymentAdd> {

  TextEditingController nameController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  Payment? payment;

  Map<String, String> populateForm() {
    return {
      'name': nameController.text,
      'amount': amountController.text.toIntFromFormatted().toString(),
      'date': dateController.text,
    };
  }

  @override
  void initState() {
    super.initState();
    if (widget.item.id != null) {
      payment = BlocProvider.of<PaymentCubit>(context).getPayment(widget.item.id!);
      if(payment != null) {
        setState(() {
          nameController.text = payment!.name;
          amountController.text = int.parse(payment!.amount).toCurrencyFormat();
          dateController.text = payment!.date;
        });
      }
    }
  }

  void validateForm() {
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
    if(widget.item.id != null) {
      showSaveDialog(context, formData);
    } else {
      onSubmit(context, formData);
    }
  }

  void onSubmit(BuildContext context, Map<String, String> data) async {
    try {
      await BlocProvider.of<PaymentCubit>(context).savePayment(
          Payment(
            id: widget.item.id != null ? widget.item.id! : const Uuid().v4(),
            name: data['name']!,
            amount: data['amount']!,
            date: data['date']!,
            vendorId: widget.item.vendorId
          )
      );
      if(context.mounted) {
        Navigator.pop(context);
      }
    } catch(e) {
      if(context.mounted) {
        DialogHandler.showSnackBar(context: context, message: "Error: $e");
      }
    }
  }

  void showSaveDialog(BuildContext context, Map<String, String> data) {
    DialogHandler.showConfirmDialog(
        context: context,
        title: "Confirmation",
        description: "We’ll save your updates so everything stays up to date. You can always make changes later.",
        confirmText: "Yes, save",
        onConfirm: () {
          Navigator.pop(context);
          onSubmit(context, data);
        }
    );
  }

  void onDelete(BuildContext context) async {
    await BlocProvider.of<PaymentCubit>(context).deletePayment(widget.item.id!);
    if(context.mounted) {
      Navigator.pop(context);
      Navigator.pop(context);
    }
  }

  void showDeleteDialog(BuildContext context) {
    DialogHandler.showConfirmDialog(
        context: context,
        title: "Confirmation",
        description: "Deleting this will erase all related data and cannot be undone. Make sure this is what you really want to do.",
        confirmText: "Yes, delete",
        onConfirm: () => onDelete(context)
    );
  }

  Widget paymentInitial(BuildContext context) {
    return Column(
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
            onPressed: validateForm,
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(context).iconTheme.color,
              padding: const EdgeInsets.all(16.0),
            ),
            child: Text(widget.item.id == null ? "Submit" : "Save"),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("${widget.item.id == null ? "Add" : "Edit"} Payment"),
          backgroundColor: Theme.of(context).colorScheme.surface,
          surfaceTintColor: Colors.transparent,
          centerTitle: true,
          actions: widget.item.id == null ? null : [
            Container(
              margin: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                icon: const Icon(Icons.delete_forever_rounded),
                tooltip: 'Delete',
                onPressed: () => showDeleteDialog(context),
              ),
            )
          ],
        ),
        body: BlocBuilder<PaymentCubit, PaymentCubitState>(
          builder: (blocContext, state) {
            if(state is PaymentInitial) {
              return paymentInitial(context);
            }
            else if(state is PaymentLoading) {
              return const LoadingState();
            }
            return Container();
          },
        )
    );
  }

}