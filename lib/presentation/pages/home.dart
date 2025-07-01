import 'package:flutter/material.dart';
import 'package:we_ready_app/presentation/pages/invitation/invitation.dart';
import '../core/constant/routes_values.dart';
import 'vendor/vendor.dart';
import 'rundown/rundown.dart';
import 'event/event.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<EventPageState> eventPageKey = GlobalKey<EventPageState>();
  final GlobalKey<VendorPageState> vendorPageKey = GlobalKey<VendorPageState>();
  final GlobalKey<InvitationPageState> invitationPageKey = GlobalKey<InvitationPageState>();
  final GlobalKey<RundownPageState> rundownPageKey = GlobalKey<RundownPageState>();

  int currentPageIndex = 0;
  String titlePage = "Event";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(titlePage),
          backgroundColor: Theme.of(context).colorScheme.surface,
          surfaceTintColor: Colors.transparent,
          centerTitle: true,
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                icon: const Icon(Icons.add_circle_outline_sharp),
                tooltip: 'Add',
                onPressed: () {
                  if(currentPageIndex == 0) {
                    Navigator.pushNamed(context, RoutesValues.eventAdd).then((_) {
                      eventPageKey.currentState?.refreshData();
                    });
                  }
                  else if(currentPageIndex == 1) {
                    Navigator.pushNamed(context, RoutesValues.vendorAdd).then((_) {
                      vendorPageKey.currentState?.refreshData();
                    });
                  }
                  else if(currentPageIndex == 2) {
                    Navigator.pushNamed(context, RoutesValues.invitationAdd).then((_) {
                      invitationPageKey.currentState?.refreshData();
                    });
                  }
                  else if(currentPageIndex == 3) {
                    Navigator.pushNamed(context, RoutesValues.rundownAdd).then((_) {
                      rundownPageKey.currentState?.refreshData();
                    });
                  }
                },
              ),
            )
          ],
        ),
        bottomNavigationBar: Stack(
          children: [
            NavigationBar(
              backgroundColor: Theme.of(context).colorScheme.surface,
              indicatorColor: Theme.of(context).colorScheme.inversePrimary,
              onDestinationSelected: (int index) {
                setState(() {
                  currentPageIndex = index;
                  if(index == 0) {
                    titlePage = "Event";
                  }
                  else if(index == 1) {
                    titlePage = "Vendor";
                  }
                  else if(index == 2) {
                    titlePage = "Invitation";
                  }
                  else if(index == 3) {
                    titlePage = "Rundown";
                  }
                });
              },
              elevation: 8.0,
              selectedIndex: currentPageIndex,
              destinations: const <Widget>[
                NavigationDestination(
                  selectedIcon: Icon(Icons.all_inclusive),
                  icon: Icon(Icons.all_inclusive),
                  label: 'Event',
                ),
                NavigationDestination(
                  selectedIcon: Icon(Icons.home),
                  icon: Icon(Icons.home),
                  label: 'Vendor',
                ),
                NavigationDestination(
                  selectedIcon: Icon(Icons.groups_rounded),
                  icon: Icon(Icons.groups_rounded),
                  label: 'Invitation',
                ),
                NavigationDestination(
                  selectedIcon: Icon(Icons.timelapse),
                  icon: Icon(Icons.timelapse),
                  label: 'Rundown',
                ),
              ],
            )
          ],
        ),
        body: Builder(
          builder: (_) {
            if (currentPageIndex == 0) return EventPageProvider(pageKey: eventPageKey);
            if (currentPageIndex == 1) return VendorPageProvider(pageKey: vendorPageKey);
            if (currentPageIndex == 2) return InvitationPageProvider(pageKey: invitationPageKey);
            if (currentPageIndex == 3) return RundownPageProvider(pageKey: rundownPageKey);
            return const SizedBox.shrink();
          },
        ),
    );
  }

}