import 'package:flutter/material.dart';

class TabBarApp extends StatefulWidget {
  const TabBarApp({super.key});

  @override
  State<TabBarApp> createState() => _TabBarAppState();
}

class _TabBarAppState extends State<TabBarApp> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool? isChecked = false;
    int? selectedValue = 1;

    return Scaffold(
      appBar: AppBar(
        title: const Text('TabBar Sample'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(icon: Icon(Icons.home)),
            Tab(icon: Icon(Icons.shopping_bag)),
            Tab(icon: Icon(Icons.brightness_5_sharp)),
          ],
        ),
      ),
      body: Column(
        children: [
          Center(
            child: Checkbox(
              value: isChecked,
              activeColor: Colors.orange[300],
              tristate: true,
              onChanged: (context) {
                setState(() {
                  isChecked = context;
                });
              },
            ),
          ),
          const Chip(
            avatar: CircleAvatar(
              backgroundColor: Color.fromARGB(255, 243, 153, 153),
            ),
            label: Text('This is a Flutter chip'),
          ),
          ListTile(
            title: Text('Option 1'),
            leading: Radio(
              value: 1,
              groupValue: selectedValue,
              onChanged: (value) {
                setState(() {
                  selectedValue = value;
                });
              },
            ),
          ),
          ListTile(
            title: Text('Option 2'),
            leading: Radio(
              value: 2,
              groupValue: selectedValue,
              onChanged: (value) {
                setState(() {
                  selectedValue = value;
                });
              },
            ),
          ),
          ListTile(
            title: Text('Option 3'),
            leading: Radio(
              value: 3,
              groupValue: selectedValue,
              onChanged: (value) {
                setState(() {
                  selectedValue = value;
                });
              },
            ),
          ),
          const TextField(
            decoration: InputDecoration(
              labelText: 'Enter your text',
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }
}
