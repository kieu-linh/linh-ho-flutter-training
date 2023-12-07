import 'package:flutter/material.dart';
import 'package:flutter_application_1/example/layout_page.dart';
import 'package:flutter_application_1/example/splash.dart';
import 'package:flutter_application_1/example/time_picker.dart';
import 'package:flutter_application_1/pages/example_page.dart';
import 'package:flutter_application_1/pages/tabbar.dart';
import 'package:flutter_application_1/responsive/media_query.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ExamplePage(),
    );
  }
}
