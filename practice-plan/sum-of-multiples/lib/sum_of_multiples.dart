class SumOfMultiples {
  // Put your code here
  int sum(List<int> multiples, int max) {
    int sum = 0;
    for (int i = 0; i < max; i++) {
      for (int j = 0; j < multiples.length; j++) {
        if (i % multiples[j] == 0) {
          sum += i;
          break;
        }
      }
    }
    return sum;
  }
}

void main() {
  final sumOfMultiples = SumOfMultiples();
  print(sumOfMultiples.sum(<int>[3, 5], 1));
  print(sumOfMultiples.sum(<int>[3, 5], 4));
  print(sumOfMultiples.sum(<int>[3], 7));
  print(sumOfMultiples.sum(<int>[3, 5], 10));
  print(sumOfMultiples.sum(<int>[3, 5], 100));
  print(sumOfMultiples.sum(<int>[3, 5], 1000));
  print(sumOfMultiples.sum(<int>[7, 13, 17], 20));
  print(sumOfMultiples.sum(<int>[4, 6], 15));
  print(sumOfMultiples.sum(<int>[5, 6, 8], 150));
  print(sumOfMultiples.sum(<int>[5, 25], 51));
  print(sumOfMultiples.sum(<int>[43, 47], 10000));
}
