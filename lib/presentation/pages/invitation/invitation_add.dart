import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';
import 'package:we_ready_app/presentation/core/extension/number_extension.dart';
import '../../../data/models/local/invitation_model.dart';
import '../../../injector.dart';
import '../../core/constant/form_type.dart';
import '../../core/handler/dialog_handler.dart';
import '../../core/widget/loading_state.dart';
import '../../core/widget/text_field_item.dart';
import 'cubit/invitation_cubit.dart';
import 'cubit/invitation_state.dart';

class InvitationAddProvider extends StatelessWidget {
  const InvitationAddProvider({super.key, this.id });
  final String? id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<InvitationCubit>(),
      child: InvitationAdd(id: id),
    );
  }
}

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
      'package': packageController.text.toIntFromFormatted().toString(),
      'confirm': confirmController.text,
    };
  }

  @override
  void initState() {
    super.initState();
    if (widget.id != null) {
      Invitation? invitation = BlocProvider.of<InvitationCubit>(context).getInvitation(widget.id!);
      if(invitation != null) {
        setState(() {
          nameController.text = invitation.name;
          categoryController.text = invitation.category;
          packageController.text = int.parse(invitation.invitationPackage).toCurrencyFormat();
          confirmController.text = invitation.confirm;
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
    if (formData['package']!.trim().isEmpty) {
      DialogHandler.showSnackBar(context: context, message: "Package cannot be empty");
      return;
    }
    if (formData['confirm']!.trim().isEmpty) {
      DialogHandler.showSnackBar(context: context, message: "Confirmation cannot be empty");
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
      String? eventId = BlocProvider.of<InvitationCubit>(context).getSelectedEventId();
      if(eventId != null) {
        await BlocProvider.of<InvitationCubit>(context).saveInvitation(
            Invitation(
              id: widget.id != null ? widget.id! : const Uuid().v4(),
              name: data['name']!,
              category: data['category']!,
              invitationPackage: data['package']!,
              confirm: data['confirm']!,
              eventId: eventId,
            )
        );
        if(context.mounted) {
          Navigator.pop(context);
        }
      } else {
        DialogHandler.showSnackBar(context: context, message: "Please add and select event before add invitation.");
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
    await BlocProvider.of<InvitationCubit>(context).deleteInvitation(widget.id!);
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

  Widget invitationInitial(BuildContext context) {
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
                onPressed: () => showDeleteDialog(context),
              ),
            )
          ],
        ),
        body: BlocBuilder<InvitationCubit, InvitationCubitState>(
          builder: (blocContext, state) {
            if(state is InvitationInitial) {
              return invitationInitial(context);
            }
            else if(state is InvitationLoading) {
              return const LoadingState();
            }
            return Container();
          },
        )
    );
  }

}