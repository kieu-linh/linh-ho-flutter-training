import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountNumberBloc extends StatelessWidget {
  const CountNumberBloc({super.key});

  @override
  Widget build(BuildContext context) {
    final CounterBloc counterBloc = BlocProvider.of<CounterBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc State Management'),
      ),
      body: BlocBuilder<CounterBloc, CounterState>(
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Count: ${state.count}',
                    style: const TextStyle(fontSize: 24)),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    counterBloc.add(1);
                  },
                  child: const Text('Increment'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// counter_state.dart
class CounterState {
  final int count;

  CounterState(this.count);
}

class CounterBloc extends Bloc<int, CounterState> {
  CounterBloc() : super(CounterState(0));

  @override
  Stream<CounterState> mapEventToState(int event) async* {
    yield CounterState(state.count + event);
  }
}
