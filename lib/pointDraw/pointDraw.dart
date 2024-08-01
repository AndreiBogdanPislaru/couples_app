import 'dart:math';

class PointDraw {
  final double x;
  final double y;

  PointDraw({required this.x, required this.y});

  @override
  String toString() {
    // TODO: implement toString
    return "x; $x y:$y";
  }
}

PointDraw? intersection(PointDraw p1, PointDraw q1, PointDraw p2, PointDraw q2) {
  if (!doIntersect(p1, q1, p2, q2)) {
    return null;
  }

  // Line p1q1 represented as a1x + b1y = c1
  double a1 = q1.y - p1.y;
  double b1 = p1.x - q1.x;
  double c1 = a1 * p1.x + b1 * p1.y;

  // Line p2q2 represented as a2x + b2y = c2
  double a2 = q2.y - p2.y;
  double b2 = p2.x - q2.x;
  double c2 = a2 * p2.x + b2 * p2.y;

  double determinant = a1 * b2 - a2 * b1;

  if (determinant == 0) {
    // The lines are parallel. This should not happen as we've already checked for intersection.
    return null;
  } else {
    double x = (b2 * c1 - b1 * c2) / determinant;
    double y = (a1 * c2 - a2 * c1) / determinant;
    return PointDraw(x: x, y: y);
  }
}

int orientation(PointDraw p, PointDraw q, PointDraw r) {
  double val = (q.y - p.y) * (r.x - q.x) - (q.x - p.x) * (r.y - q.y);
  if (val == 0) return 0; // Collinear
  return (val > 0) ? 1 : 2; // Clockwise or Counterclockwise
}

bool onSegment(PointDraw p, PointDraw q, PointDraw r) {
  if (q.x <= max(p.x, r.x) && q.x >= min(p.x, r.x) && q.y <= max(p.y, r.y) && q.y >= min(p.y, r.y)) {
    return true;
  }
  return false;
}

bool doIntersect(PointDraw p1, PointDraw q1, PointDraw p2, PointDraw q2) {
  int o1 = orientation(p1, q1, p2);
  int o2 = orientation(p1, q1, q2);
  int o3 = orientation(p2, q2, p1);
  int o4 = orientation(p2, q2, q1);

  // General case
  if (o1 != o2 && o3 != o4) {
    return true;
  }

  // Special Cases
  // p1, q1 and p2 are collinear and p2 lies on segment p1q1
  if (o1 == 0 && onSegment(p1, p2, q1)) return true;

  // p1, q1 and q2 are collinear and q2 lies on segment p1q1
  if (o2 == 0 && onSegment(p1, q2, q1)) return true;

  // p2, q2 and p1 are collinear and p1 lies on segment p2q2
  if (o3 == 0 && onSegment(p2, p1, q2)) return true;

  // p2, q2 and q1 are collinear and q1 lies on segment p2q2
  if (o4 == 0 && onSegment(p2, q1, q2)) return true;

  return false; // Doesn't fall in any of the above cases
}
