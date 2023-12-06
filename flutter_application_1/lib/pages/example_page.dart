import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class ExamplePage extends StatefulWidget {
  const ExamplePage({super.key});

  @override
  State<ExamplePage> createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  bool isCheck = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Gemstore',
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const badges.Badge(
                child: Icon(Icons.notifications_outlined),
              )),
        ],
        leading: IconButton(
          onPressed: () {
            setState(() {
              isCheck = true;
            });
          },
          icon: const Icon(Icons.menu),
        ),
      ),
      body: Drawer(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(24.0),
              child: Wrap(
                runSpacing: 16,
                children: [
                  ListTile(
                    leading: const Icon(Icons.home),
                    title: const Text('Home'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.search),
                    title: const Text('Search'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.shopping_bag_outlined),
                    title: const Text('Cart'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.person_2_outlined),
                    title: const Text('Person'),
                    onTap: () {},
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        color: Colors.pink[50],
        child: IconTheme(
          data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                tooltip: 'Home',
                icon: const Icon(Icons.home, color: Colors.black),
                onPressed: () {},
              ),
              IconButton(
                tooltip: 'Search',
                icon: const Icon(Icons.search, color: Colors.grey),
                onPressed: () {},
              ),
              IconButton(
                tooltip: 'Cart',
                icon:
                    const Icon(Icons.shopping_bag_outlined, color: Colors.grey),
                onPressed: () {},
              ),
              IconButton(
                tooltip: 'Person',
                icon: const Icon(Icons.person_2_outlined, color: Colors.grey),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
