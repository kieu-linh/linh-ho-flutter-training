class NthPrime {
  bool isPrime(int number) {
    for (int start = 2; start < number; start++) {
      if (number % start == 0) return false;
    }
    return true;
  }

  int prime(int n) {
    if (n == 0) throw new ArgumentError('There is no zeroth prime');
    int number = 2;
    for (int count = 0; count < n; number++) {
      if (isPrime(number)) count++;
    }
    return number - 1;
  }
}

void main(List<String> args) {
  final nthPrime = NthPrime();
  print(nthPrime.prime(10001));
}
