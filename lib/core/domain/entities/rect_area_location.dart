import 'dart:ffi';

class RectAreaLocation {
  final Double topLeftPoint;
  final Double topRightPoint;
  final Double bottomLeftPoint;
  final Double bottomRightPoint;

  RectAreaLocation({
    required this.topLeftPoint,
    required this.topRightPoint,
    required this.bottomLeftPoint,
    required this.bottomRightPoint,
  });
}
