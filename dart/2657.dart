import 'dart:collection';

class Solution {
  List<int> findThePrefixCommonArray(List<int> A, List<int> B) {
    if (A.isEmpty) return const [];

    final ACache = [];
    final BCache = LinkedHashSet<int>();

    final commonCounts = <int>[];

    for (int i = 0; i < A.length; i++) {
      ACache.add(A[i]);
      BCache.add(B[i]);

      commonCounts.add(ACache.fold(0, (v, e) => v += BCache.contains(e) ? 1 : 0));
    }

    return commonCounts;
  }
}

// void main() {
//   print("${Solution().findThePrefixCommonArray([2, 3, 1], [3, 1, 2])}");
// }
