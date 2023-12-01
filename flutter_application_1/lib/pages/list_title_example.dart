import 'package:flutter/material.dart';

class ListTitle extends StatelessWidget {
  const ListTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return const ListTile(
            title: Text('List Title!'),
            tileColor: Color.fromARGB(255, 182, 138, 171),
            leading: Icon(Icons.person),
            trailing: Icon(Icons.menu),
          );
        },
        separatorBuilder: (context, index) => const Divider(
              color: Colors.black,
            ),
        itemCount: 5);
  }
}
