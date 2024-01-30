import 'package:flutter/material.dart';
import 'package:flutter_application_1/example/state_manage/count_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountNumberBloc extends StatelessWidget {
  const CountNumberBloc({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final CounterBloc counterBloc = BlocProvider.of<CounterBloc>(context);

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CounterBloc, DataState>(builder: (context, state) {
              if (state is Success) {
                return Text(
                  '${state.count}',
                  style: Theme.of(context).textTheme.headline4,
                );
              } else {
                return new CircularProgressIndicator();
              }
            })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counterBloc.add(Increment());
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

/// State
class DataState {}

class Loading extends DataState {}

class Success extends DataState {
  int count = 0;

  Success(this.count);
}

/// Event
class DataEvent {}

class Increment extends DataEvent {}

// counter_state.dart
class CounterState {
  final int count;

  CounterState(this.count);
}
