import 'dart:io';

Map<String, int> countWord(String st) {
  stdout.write('Enter a string: ');
  String st = stdin.readLineSync().toString().trim();
  st = st.toLowerCase().replaceAll(RegExp(r'[^\w\s]'), '');
  print('value: $st ');
  final words = st.split(' ');
  print(words);
  final count = <String, int>{};
  for (var word in words) {
    if (count.containsKey(word)) {
      count[word] = count[word]! + 1;
    } else {
      count[word] = 1;
    }
  }
  return count;
}

void main() {
  print(countWord(''));
}
