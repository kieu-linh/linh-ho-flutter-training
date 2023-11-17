class Darts {
  int score(double a, double b) {
    double c = a * a + b * b;
    if (c <= 1) return 10;
    if (c <= 25) return 5;
    if (c <= 100) return 1;
    return 0;
  }
}
