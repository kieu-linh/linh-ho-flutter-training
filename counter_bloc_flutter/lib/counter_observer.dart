import 'package:bloc/bloc.dart';

class CounterObserver extends BlocObserver {
  const CounterObserver();

  // function to change the state of the counter
  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    print('${bloc.runtimeType} $change');
  }
}
