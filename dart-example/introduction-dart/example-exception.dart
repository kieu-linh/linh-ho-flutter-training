//example exception in dart
void main() {
  try {
    var result = int.parse('abc');
    print('Result: $result');
  } on FormatException catch (e) {
    print('Caught a FormatException: $e');
  } catch (e) {
    print('Caught an exception: $e');
  }
}
