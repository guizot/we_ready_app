import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:we_ready_app/data/models/local/event_model.dart';
import 'package:we_ready_app/presentation/pages/event/cubit/event_cubit.dart';
import '../../core/constant/routes_values.dart';
import '../../core/handler/dialog_handler.dart';
import '../../core/widget/add_item.dart';
import '../../core/widget/dashed_container.dart';
import 'cubit/event_state.dart';
import 'event_list.dart';

class EventSwitch extends StatefulWidget {
  final VoidCallback onChanged;

  const EventSwitch({super.key, required this.onChanged});

  @override
  State<EventSwitch> createState() => _EventSwitchState();
}

class _EventSwitchState extends State<EventSwitch> {

  @override
  void initState() {
    super.initState();
    context.read<EventCubit>().getAllEvent();
  }

  void _showEventList(BuildContext context, List<Event> events) {
    DialogHandler.showBottomSheet(
      context: context,
      child: EventList(
        events: events,
        onAdd: () => _navigateToAddEvent(context),
        onEdit: (id) => _navigateToEditEvent(context, id),
        onSelect: (event) => _selectEvent(context, event),
        onBack: () {
          if (context.mounted) {
            Navigator.pop(context);
            setState(() {});
          }
        },
      ),
    );
  }

  void _navigateToAddEvent(BuildContext context) {
    Navigator.popAndPushNamed(context, RoutesValues.eventAdd).then((_) {
      if (context.mounted) {
        widget.onChanged();
      }
    });
  }

  void _navigateToEditEvent(BuildContext context, String id) {
    Navigator.popAndPushNamed(context, RoutesValues.eventAdd, arguments: id).then((_) {
      if (context.mounted) {
        widget.onChanged();
      }
    });
  }

  void _navigateAddIfEmpty(BuildContext context) {
    Navigator.pushNamed(context, RoutesValues.eventAdd).then((_) {
      if (context.mounted) {
        context.read<EventCubit>().getAllEvent();
        widget.onChanged();
      }
    });
  }

  void _selectEvent(BuildContext context, Event event) async {
    await context.read<EventCubit>().selectEvent(event);
    widget.onChanged();
  }

  Widget loadingEventItem() {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 21, horizontal: 24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: Theme.of(context).hoverColor,
          ),
          child: Center(
            child: SizedBox(
              height: 22,
              width: 22,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: Theme.of(context).iconTheme.color,
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget addEventItem() {
    return Column(
      children: [
        DashedBorderContainer(
          borderColor: Colors.grey,
          borderRadius: 20.0,
          child: GestureDetector(
              onTap: () => _navigateAddIfEmpty(context),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 21, horizontal: 24),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: Theme.of(context).hoverColor,
                ),
                child: const Center(
                  child: Text(
                    "Add Event +",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14
                    ),
                  ),
                ),
              )
          )
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget selectedEventItem({
    required String name,
    required GestureTapCallback onTap
  }) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: Theme.of(context).hoverColor,
            ),
            child: Row(
              children: [
                const Icon(Icons.list_alt_rounded, size: 18),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    name,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
                const Icon(Icons.keyboard_arrow_down_sharp, size: 24),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventCubit, EventCubitState>(
      builder: (context, state) {
        if (state is EventInitial) {
          return const SizedBox.shrink();
        } else if (state is EventLoading) {
          return loadingEventItem();
        } else if (state is EventEmpty) {
          return addEventItem();
        } else if (state is EventLoaded) {
          return selectedEventItem(
            name: context.read<EventCubit>().getSelectedEventName(),
            onTap: () => _showEventList(context, state.events),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

}
