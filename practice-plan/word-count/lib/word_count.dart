// import 'dart:async';
// import 'dart:io';

class WordCount {
  Map<String, int> countWords(String st) {
    // String st = stdin.readLineSync().toString().trim();
    String st = 'one fish two fish red fish blue fish';
    st = st.toLowerCase().replaceAll(RegExp(r'[^\w\s]'), '');

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
}

// void main() {
//   print(WordCount().countWords(''));
// }
