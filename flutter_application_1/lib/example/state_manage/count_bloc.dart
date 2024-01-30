import 'package:flutter_application_1/example/state_manage/user_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<DataEvent, DataState> {
  int count = 0;

  CounterBloc() : super(Success(1));
  @override
  DataState get initialState => Success(count);

  @override
  Stream<DataState> mapEventToState(DataEvent event) async* {
    if (event is Increment) {
      yield Loading();
      await Future.delayed(const Duration(seconds: 1));
      count++;
      yield Success(count);
    }
  }
}
