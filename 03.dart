class Point {
  double? x;
  double? y;
  double z = 0;
}

class Shape {
  Point? origin;
  double size = 0;
}

void main() {
  var p = Point();
  var s = Shape();
  s.origin = p;
  s.origin?.x = 20;
}
