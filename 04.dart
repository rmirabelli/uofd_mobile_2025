class Point {
  double x = 0;
  double y = 0;

  Point(double x, double y) : assert(x > 0), x = x, y = y;
}

void main() {
  var p = Point(-5, 5);
  print(p);
}
