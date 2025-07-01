import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/local/event_model.dart';
import '../../../injector.dart';
import '../../core/constant/routes_values.dart';
import '../../core/handler/dialog_handler.dart';
import '../../core/widget/empty_state.dart';
import '../../core/widget/loading_state.dart';
import 'cubit/event_cubit.dart';
import 'cubit/event_state.dart';
import 'event_list.dart';
import '../invitation/invitation_summary.dart';
import '../rundown/rundown_summary.dart';
import '../vendor/vendor_summary.dart';

class EventPageProvider extends StatelessWidget {
  const EventPageProvider({super.key, this.pageKey});
  final Key? pageKey;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<EventCubit>(),
      child: EventPage(key: pageKey),
    );
  }
}

class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  State<EventPage> createState() => EventPageState();
}

class EventPageState extends State<EventPage> {

  Map<String, dynamic>? summaryVendor;
  Map<String, dynamic>? summaryInvitation;
  Map<String, dynamic>? summaryRundown;

  @override
  void initState() {
    super.initState();
    context.read<EventCubit>().getAllEvent();
    getSummary();
  }

  void getSummary() {
    setState(() {
      summaryVendor = context.read<EventCubit>().getSummaryVendor();
      summaryInvitation = context.read<EventCubit>().getSummaryInvitation();
      summaryRundown = context.read<EventCubit>().getSummaryRundown();
    });
  }

  void refreshData() {
    context.read<EventCubit>().getAllEvent();
    getSummary();
    setState(() {});
  }

  void showEventList(BuildContext context, List<Event> events) {
    DialogHandler.showBottomSheet(
      context: context,
      child: EventList(
        events: events,
        onEdit: (id) => navigateToEditEvent(id),
        onSelect: (Event event) async {
          await context.read<EventCubit>().selectEvent(event);
          refreshData();
        },
        onBack: () {
          if (context.mounted) {
            Navigator.pop(context);
            setState(() {});
          }
        },
      ),
    );
  }


  void navigateVendorAdd() {
    Navigator.pushNamed(context, RoutesValues.eventAdd).then((value) => refreshData());
  }

  void navigateToEditEvent(String id) {
    Navigator.popAndPushNamed(context, RoutesValues.eventAdd, arguments: id).then((value) => refreshData());
  }

  Widget eventLoaded(List<Event> events) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Column(
          children: [
            GestureDetector(
              onTap: () => showEventList(context, events),
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
                        context.read<EventCubit>().getSelectedEventName(),
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
        ),
        VendorSummary(summary: summaryVendor),
        InvitationSummary(summary: summaryInvitation),
        RundownSummary(summary: summaryRundown),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventCubit, EventCubitState>(
      builder: (context, state) {
        if (state is EventInitial) {
          return const SizedBox.shrink();
        }
        else if (state is EventLoading) {
          return const LoadingState();
        }
        else if (state is EventEmpty) {
          return EmptyState(
            title: "No Records",
            subtitle: "You haven’t added any events. Once you do, they’ll appear here.",
            tapText: "Add Event +",
            onTap: navigateVendorAdd,
          );
        }
        else if (state is EventLoaded) {
          return eventLoaded(state.events);
        }
        return const SizedBox.shrink();
      },
    );
  }

}