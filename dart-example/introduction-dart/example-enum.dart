//example enum in dart
enum Shape {
    circle,
    square,
    rectangle,
  }
void main() {
  Shape shape = Shape.circle;
  switch (shape) {
    case Shape.circle:
      print('circle');
      break;
    case Shape.square:
      print('square');
      break;
    case Shape.rectangle:
      print('rectangle');
      break;
  }
}