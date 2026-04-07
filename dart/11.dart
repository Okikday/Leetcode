import "dart:math" as math;

class Solution {
  int maxArea(List<int> height) {
    int maximumArea = 0; // Start off with 0
    int left = 0; // Start point on x axis
    int right = height.length - 1; // End point on x axis (totalWidth)
    if (right <= 0) return 0;

    while (right > left) {
      final leftH = height[left]; // Current height of the left pointer
      final rightH = height[right]; // Current height of the right pointer

      final currArea = _computeArea(left, right, leftH, rightH); // The area between the left and right pointer

      // Since we are looking for the maximum area, we check if the one we just computed is greater than the one we've already found. If so, we set it
      if (currArea > maximumArea) maximumArea = currArea;

      // If the left line height is greater than that of the right, move to the right (ignore the shorter line on the right, there may be a taller one on the left)
      leftH > rightH ? right-- : left++;
    }

    return maximumArea;
  }

  /// Returns the area between two heights,
  /// by multiplying the mininum of the both heights (which is the max height a liquid can fill) and width between them
  int _computeArea(int x1, int x2, int y1, int y2) => math.min(y1, y2) * (x2 - x1).abs();
}
