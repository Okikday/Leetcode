import 'dart:collection';
import 'dart:math' as math;

class Solution {
  List<List<int>> merge(List<List<int>> intervals) {
    intervals.sort((a, b) => a[0].compareTo(b[0]));
    print("intervals sorted: ${intervals}");
    LinkedHashSet<List<int>> merged = LinkedHashSet();
    for (final interval in intervals) {
      // if the list of merged intervals is empty or if the current
      // interval does not overlap with the previous, simply append it.
      if (merged.isEmpty || merged.last[1] < interval[0]) {
        merged.add(interval);
      }
      // otherwise, there is overlap, so we merge the current and previous
      // intervals.
      else {
        merged.last[1] = math.max(merged.last[1], interval[1]);
      }
    }
    return merged.toList();
  }
}

void main() {
  print(
    "${Solution().merge([
      [1, 3],
      [2, 6],
      [8, 10],
      [15, 18],
    ])}",
  );
}
