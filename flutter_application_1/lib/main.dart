import 'package:flutter/material.dart';
import 'package:flutter_application_1/example/state_manage/user_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:flutter_application_1/example/state_manage/use_provider.dart';
//import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => CounterBloc(),
        child: const CountNumberBloc(),
      ),
    );
    /*ChangeNotifierProvider(
      create: (context) => Counter(),
      child: const MaterialApp(
        title: 'State Management Example',
        home: CountNumber(),
      ),
    );*/
  }
}
