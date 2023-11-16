class Triangle {
  // Put your code here
  bool equilateral(double a, double b, double c) {
    if (a == b && b == c) {
      return true;
    }
    return false;
  }
  bool isosceles(double a, double b, double c) {
    if (a == b || b == c || a == c) {
      return true;
    }
    return false;
  }

  bool scalene(double a, double b, double c) {
    if (a != b && b != c && a != c) {
      return true;
    }
    return false;
  }
}
