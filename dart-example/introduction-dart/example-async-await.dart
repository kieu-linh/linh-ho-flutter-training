class ExampleAsyncAwait {
  Future<void> main() async {
    print('Before the future');
    final value = await Future<int>.delayed(Duration(seconds: 1), () => 42);
    print('Value: $value');
    print('After the future');
  }
  
  Future<void> main2() async {
    print('Before the future');
    try {
      final value = await Future<int>.delayed(
        Duration(seconds: 1),
        () => 42,
      );
      print('Value: $value');
    } catch (error) {
      print(error);
    } finally {
      print('Future is complete');
    }
    print('After the future');
  }
}