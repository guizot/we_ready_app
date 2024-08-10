import 'package:flutter/material.dart';
import 'package:we_ready_app/presentation/pages/invitation/invitation.dart';
import '../vendor/vendor.dart';
import '../rundown/rundown.dart';
import '../setting/setting.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPageIndex = 0;
  String titlePage = "Vendor";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(titlePage),
          backgroundColor: Theme.of(context).colorScheme.surface,
          surfaceTintColor: Colors.transparent,
          centerTitle: true,
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
                    titlePage = "Vendor";
                  }
                  else if(index == 1) {
                    titlePage = "Invitation";
                  }
                  else if(index == 2) {
                    titlePage = "Rundown";
                  }
                  else if(index == 3) {
                    titlePage = "Profile";
                  }
                });
              },
              elevation: 8.0,
              selectedIndex: currentPageIndex,
              destinations: const <Widget>[
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
                NavigationDestination(
                  selectedIcon: Icon(Icons.person),
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],
            )
          ],
        ),
        body: <Widget>[
          const VendorPage(),
          const InvitationPage(),
          const RundownPage(),
          const SettingWrapperProvider()
        ][currentPageIndex],
    );
  }

}