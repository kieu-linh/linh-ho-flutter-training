import 'package:flutter/material.dart';
import 'package:flutter_application_1/example/inherited_widget.dart';
import 'package:flutter_application_1/example/state_manage/change_notifier.dart';
import 'package:flutter_application_1/example/state_manage/use_getX.dart';
import 'package:flutter_application_1/example/state_manage/user_bloc.dart';
import 'package:flutter_application_1/example/state_manage/value_notifier.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
//import 'package:flutter_application_1/example/state_manage/use_provider.dart';
//import 'package:provider/provider.dart';

void main() {
  /*runApp(const GetMaterialApp(
    home: MyApp(),
  )*/
  runApp(const MyApp());
  // );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeValue(),
    );
    /*MyExample(
        onChanged: (p0) {
          print('onChanged: $p0');
          (context as Element).markNeedsBuild();
        },
        data: 42,
        child: const MaterialApp(
          home: UpdateData(),
        ));*/
    /*Get.put(CounterController());
    return const MaterialApp(home: CountNumberGetX()
        BlocProvider(
        create: (context) => CounterBloc(),
        child: const CountNumberBloc(),
      ),
        );*/
    /*ChangeNotifierProvider(
      create: (context) => Counter(),
      child: const MaterialApp(
        title: 'State Management Example',
        home: CountNumber(),
      ),
    );*/
  }
}
