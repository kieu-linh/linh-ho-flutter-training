class Anagram {
  List<String> findAnagrams(String word, List<String> list) {
    final result = <String>[];
    final wordLower = word.toLowerCase();
    final wordSorted = wordLower.split('').toList()..sort();
    for (final item in list) {
      final itemLower = item.toLowerCase();
      if (itemLower == wordLower) {
        continue;
      }
      final itemSorted = itemLower.split('').toList()..sort();
      if (itemSorted.join() == wordSorted.join()) {
        result.add(item);
      }
    }
    return result;
  }
}
