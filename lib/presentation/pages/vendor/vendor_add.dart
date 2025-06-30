import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';
import 'package:we_ready_app/presentation/core/extension/number_extension.dart';
import '../../../data/models/local/vendor_model.dart';
import '../../../injector.dart';
import '../../core/handler/dialog_handler.dart';
import '../../core/widget/loading_state.dart';
import '../../core/widget/text_field_item.dart';
import 'cubit/vendor_cubit.dart';
import 'cubit/vendor_state.dart';

class VendorAddProvider extends StatelessWidget {
  const VendorAddProvider({super.key, this.id });
  final String? id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<VendorCubit>(),
      child: VendorAdd(id: id),
    );
  }
}

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
      'budget': budgetController.text.toIntFromFormatted().toString(),
    };
  }

  @override
  void initState() {
    super.initState();
    if (widget.id != null) {
      Vendor? vendor = BlocProvider.of<VendorCubit>(context).getVendor(widget.id!);
      if(vendor != null) {
        setState(() {
          nameController.text = vendor.name;
          categoryController.text = vendor.category;
          budgetController.text = int.parse(vendor.budget).toCurrencyFormat();
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
    if (formData['category']!.trim().isEmpty) {
      DialogHandler.showSnackBar(context: context, message: "Category cannot be empty");
      return;
    }
    if (formData['budget']!.trim().isEmpty) {
      DialogHandler.showSnackBar(context: context, message: "Budget cannot be empty");
      return;
    }
    if(widget.id != null) {
      showSaveDialog(context, formData);
    } else {
      onSubmit(context, formData);
    }
  }

  void onSubmit(BuildContext context, Map<String, String> data) async {
    try {
      String eventId = BlocProvider.of<VendorCubit>(context).getSelectedEventId();
      await BlocProvider.of<VendorCubit>(context).saveVendor(
        Vendor(
          id: widget.id != null ? widget.id! : const Uuid().v4(),
          name: data['name']!,
          category: data['category']!,
          budget: data['budget']!,
          eventId: eventId
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
    await BlocProvider.of<VendorCubit>(context).deleteVendor(widget.id!);
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

  Widget vendorInitial(BuildContext context) {
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
            onPressed: validateForm,
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(context).iconTheme.color,
              padding: const EdgeInsets.all(16.0),
            ),
            child: Text(widget.id == null ? "Submit" : "Save"),
          ),
        ),
      ],
    );
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
                onPressed: () => showDeleteDialog(context),
              ),
            )
          ],
        ),
        body: BlocBuilder<VendorCubit, VendorCubitState>(
          builder: (blocContext, state) {
            if(state is VendorInitial) {
              return vendorInitial(context);
            }
            else if(state is VendorLoading) {
              return const LoadingState();
            }
            return Container();
          },
        )
    );
  }

}