import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import 'package:we_ready_app/presentation/core/constant/form_type.dart';
import '../../../data/models/local/rundown_model.dart';
import '../../../injector.dart';
import '../../core/handler/dialog_handler.dart';
import '../../core/widget/loading_state.dart';
import '../../core/widget/text_field_item.dart';
import 'cubit/rundown_cubit.dart';
import 'cubit/rundown_state.dart';

class RundownAddProvider extends StatelessWidget {
  const RundownAddProvider({super.key, this.id });
  final String? id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<RundownCubit>(),
      child: RundownAdd(id: id),
    );
  }
}

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

  Map<String, String> populateForm() {
    return {
      'name': nameController.text,
      'start': startController.text,
      'end': endController.text,
      'description': descController.text,
    };
  }

  @override
  void initState() {
    super.initState();
    if (widget.id != null) {
      Rundown? rundown = BlocProvider.of<RundownCubit>(context).getRundown(widget.id!);
      if(rundown != null) {
        setState(() {
          nameController.text = rundown.name;
          startController.text = rundown.start;
          endController.text = rundown.end;
          descController.text = rundown.description;
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
    if(widget.id != null) {
      showSaveDialog(context, formData);
    } else {
      onSubmit(context, formData);
    }
  }

  void onSubmit(BuildContext context, Map<String, String> data) async {
    try {
      String eventId = BlocProvider.of<RundownCubit>(context).getSelectedEventId();
      await BlocProvider.of<RundownCubit>(context).saveRundown(
          Rundown(
            id: widget.id != null ? widget.id! : const Uuid().v4(),
            name: data['name']!,
            start: data['start']!,
            end: data['end']!,
            description: data['description']!,
            eventId: eventId,
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
    await BlocProvider.of<RundownCubit>(context).deleteRundown(widget.id!);
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

  Widget rundownInitial(BuildContext context) {
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
                onPressed: () => showDeleteDialog(context),
              ),
            )
          ],
        ),
        body: BlocBuilder<RundownCubit, RundownCubitState>(
          builder: (blocContext, state) {
            if(state is RundownInitial) {
              return rundownInitial(context);
            }
            else if(state is RundownLoading) {
              return const LoadingState();
            }
            return Container();
          },
        )
    );
  }

}