import 'package:flutter/material.dart';
import '../calculator/calculator.dart';
import '../setting/setting.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPageIndex = 0;
  String titlePage = "Calculator";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(titlePage),
          backgroundColor: Theme.of(context).colorScheme.surface,
          surfaceTintColor: Colors.transparent,
          centerTitle: true,
          actions: [
            currentPageIndex != 3 ? Container(
              margin: const EdgeInsets.only(right: 16.0),
              child: IconButton(
                icon: const Icon(Icons.add_circle_outline),
                tooltip: 'Add',
                onPressed: () { },
              ),
            ) : Container()
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
                    titlePage = "Calculator";
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
                  icon: Icon(Icons.home_outlined),
                  label: 'Calculator',
                ),
                NavigationDestination(
                  selectedIcon: Icon(Icons.groups_rounded),
                  icon: Icon(Icons.groups_outlined),
                  label: 'Invitation',
                ),
                NavigationDestination(
                  selectedIcon: Icon(Icons.format_list_bulleted),
                  icon: Icon(Icons.format_list_bulleted_outlined),
                  label: 'Rundown',
                ),
                NavigationDestination(
                  selectedIcon: Icon(Icons.person),
                  icon: Icon(Icons.person_outline),
                  label: 'Profile',
                ),
              ],
            )
          ],
        ),
        body: <Widget>[
          const CalculatorPage(),
          Container(
              child: const Center(
                child: Text("INVITATION"),
              )
          ),
          Container(
              child: const Center(
                child: Text("RUNDOWN"),
              )
          ),
          const SettingWrapperProvider()
        ][currentPageIndex],
    );
  }

}