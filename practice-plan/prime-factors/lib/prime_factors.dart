class PrimeFactors {
  List<int> factors(int n) {
    final factors = <int>[];
    if (n == 1) {
      return factors;
    }
    for (int i = 2; n > 1; i++) {
      while (n % i == 0) {
        factors.add(i);
        n ~/= i;
      }
    }
    return factors;
  }
}

void main() {
  final primeFactors = PrimeFactors();
  print(primeFactors.factors(901255));
}
