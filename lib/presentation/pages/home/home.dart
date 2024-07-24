import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../calculator/calculator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(
              MediaQuery.of(context).size.width,
              MediaQuery.of(context).size.height * 0.175
          ),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.175,
            color: Theme.of(context).colorScheme.primary,
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.05,
              left: MediaQuery.of(context).size.width * 0.05,
              right: MediaQuery.of(context).size.width * 0.05
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text.rich(
                  TextSpan(
                      children: [
                        TextSpan(
                            text: "The Wedding Of\n",
                            style: TextStyle(
                              fontSize: 16.0
                            )
                        ),
                        TextSpan(
                            text: "Jack & Gill",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24.0
                            )
                        )
                      ]
                  )
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                            Radius.circular(24.0)
                        ),
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Colors.black,
                      )
                  )
                )
              ],
            )
          ),
        ),
        bottomNavigationBar: Stack(
          children: [
            NavigationBar(
              backgroundColor: Theme.of(context).colorScheme.primary,
              onDestinationSelected: (int index) {
                setState(() {
                  currentPageIndex = index;
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
              color: Theme.of(context).colorScheme.primary,
              child: const Center(
                child: Text("INVITATION"),
              )
          ),
          Container(
              color: Theme.of(context).colorScheme.primary,
              child: const Center(
                child: Text("RUNDOWN"),
              )
          ),
          Container(
              color: Theme.of(context).colorScheme.primary,
              child: const Center(
                child: Text("PROFILE"),
              )
          ),
        ][currentPageIndex],
    );
  }

}