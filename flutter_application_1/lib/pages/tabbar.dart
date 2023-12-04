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
          TabBarView(
            controller: _tabController,
            children: const [
              Center(
                  child: Column(
                children: [
                  Text("Home"),
                ],
              )),
              Center(child: Text("Cart")),
              Center(child: Text("Setting")),
            ],
          ),
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
          )
        ],
      ),
    );
  }
}
