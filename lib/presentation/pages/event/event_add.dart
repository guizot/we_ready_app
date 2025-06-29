import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';
import 'package:we_ready_app/presentation/core/extension/number_extension.dart';
import '../../../data/models/local/event_model.dart';
import '../../../injector.dart';
import '../../core/handler/dialog_handler.dart';
import '../../core/widget/LoadingState.dart';
import '../../core/widget/text_field_item.dart';
import 'cubit/event_cubit.dart';
import 'cubit/event_state.dart';

class EventAddProvider extends StatelessWidget {
  const EventAddProvider({super.key, this.id });
  final String? id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<EventCubit>(),
      child: EventAdd(id: id),
    );
  }
}

class EventAdd extends StatefulWidget {
  const EventAdd({super.key, this.id});
  final String? id;
  @override
  State<EventAdd> createState() => _EventAddState();
}

class _EventAddState extends State<EventAdd> {

  TextEditingController titleController = TextEditingController();
  TextEditingController budgetController = TextEditingController();
  TextEditingController descController = TextEditingController();

  Map<String, String> populateForm() {
    return {
      'title': titleController.text,
      'budget': budgetController.text.toIntFromFormatted().toString(),
      'description': descController.text,
    };
  }

  @override
  void initState() {
    super.initState();
    if (widget.id != null) {
      Event? event = BlocProvider.of<EventCubit>(context).getEvent(widget.id!);
      if(event != null) {
        setState(() {
          titleController.text = event.title;
          budgetController.text = int.parse(event.budget).toCurrencyFormat();
          descController.text = event.description;
        });
      }
    }
  }

  void onSubmit(BuildContext context) async {
    final formData = populateForm();
    if (formData['title']!.trim().isEmpty) {
      DialogHandler.showSnackBar(context: context, message: "Title cannot be empty");
      return;
    }
    if (formData['budget']!.trim().isEmpty) {
      DialogHandler.showSnackBar(context: context, message: "Budget cannot be empty");
      return;
    }
    if (formData['description']!.trim().isEmpty) {
      DialogHandler.showSnackBar(context: context, message: "Description cannot be empty");
      return;
    }
    try {
      await BlocProvider.of<EventCubit>(context).saveEvent(Event(
        id: widget.id != null ? widget.id! : const Uuid().v4(),
        title: formData['title']!,
        budget: formData['budget']!,
        description: formData['description']!
      ));
      if(context.mounted) {
        Navigator.pop(context);
      }
    } catch(e) {
      if(context.mounted) {
        DialogHandler.showSnackBar(context: context, message: "Error: $e");
      }
    }
  }

  void onDelete(BuildContext context) async {
    await BlocProvider.of<EventCubit>(context).deleteEvent(widget.id!);
    if(context.mounted) {
      Navigator.pop(context);
      Navigator.pop(context);
    }
  }

  void showDeleteDialog(BuildContext context) {
    DialogHandler.showBottomSheet(
        context: context,
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  Container(
                    height: 5.0,
                    width: MediaQuery.of(context).size.width / 4,
                    decoration: BoxDecoration(
                        color: Theme.of(context).hoverColor,
                        borderRadius: const BorderRadius.all(Radius.circular(25.0))
                    ),
                  ),
                  const SizedBox(height: 18.0),
                  const Text(
                    "Confirmation",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8.0),
                  const Text(
                    "Deleting this will erase all related data and cannot be undone. Make sure this is what you really want to do.",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    children: [
                      Expanded(
                        child: FilledButton(
                          onPressed: () => Navigator.pop(context),
                          style: FilledButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            foregroundColor: Theme.of(context).iconTheme.color,
                            side: BorderSide(
                              color: Theme.of(context).iconTheme.color!,
                              width: 1.5,
                            ),
                            padding: const EdgeInsets.all(16.0),
                          ),
                          child: const Text("Cancel"),
                        )
                      ),
                      const SizedBox(width: 8.0),
                      Expanded(
                          child: FilledButton(
                            onPressed: () => onDelete(context),
                            style: FilledButton.styleFrom(
                              backgroundColor: Theme.of(context).iconTheme.color,
                              padding: const EdgeInsets.all(16.0),
                            ),
                            child: const Text("Delete"),
                          )
                      )
                    ],
                  ),
                ],
              )
          ),
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("${widget.id == null ? "Add" : "Edit"} Event"),
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
        body: BlocBuilder<EventCubit, EventCubitState>(
          builder: (blocContext, state) {
            if(state is EventInitial) {
              return Column(
                children: [
                  Expanded(
                      child: ListView(
                        padding: const EdgeInsets.all(16.0),
                        children: [
                          TextFieldItem(
                              title: "Title",
                              controller: titleController
                          ),
                          TextFieldItem(
                              title: "Budget",
                              inputType: TextInputType.number,
                              preText: "Rp",
                              controller: budgetController
                          ),
                          TextFieldItem(
                              title: "Description",
                              inputType: TextInputType.multiline,
                              controller: descController
                          ),
                        ],
                      )
                  ),
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: () => onSubmit(context),
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
            else if(state is EventLoading) {
              return const LoadingState();
            }
            return Container();
          },
        )
    );
  }

}