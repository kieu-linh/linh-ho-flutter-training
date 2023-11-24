String reverse(String input) {
  if (input.isEmpty) {
    return input;
  }
  String result = input.split('').reversed.join('');
  print(result);
  throw UnimplementedError();
}

//test
void main() {
  reverse('Robot');
}
