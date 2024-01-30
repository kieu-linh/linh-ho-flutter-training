import 'package:flutter/material.dart';

class StatefulWidgetPage extends StatefulWidget {
  const StatefulWidgetPage({super.key});

  @override
  State<StatefulWidgetPage> createState() => _StatefulWidgetPageState();
}

class _StatefulWidgetPageState extends State<StatefulWidgetPage> {
  int currenIndex = 0;
  final screen = [
    const Center(child: Text('Home', style: TextStyle(fontSize: 56.0))),
    const Center(child: Text('Search', style: TextStyle(fontSize: 56.0))),
    const Center(child: Text('Cart', style: TextStyle(fontSize: 56.0))),
    const Center(child: Text('Profile', style: TextStyle(fontSize: 56.0)))
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[currenIndex],
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          NavigationDestination(
            icon: Icon(Icons.shopping_bag_outlined),
            label: 'Cart',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_2_outlined),
            label: 'Profile',
          ),
        ],
        selectedIndex: currenIndex,
        onDestinationSelected: (int index) {
          setState(() {
            currenIndex = index;
          });
        },
      ),
    );
  }
}
