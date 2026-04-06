import 'dart:developer';

class Solution {
  int twoCitySchedCost(List<List<int>> costs) {
    final diffMap = <int, int>{};

    for (int i = 0; i < costs.length; i++) {
      diffMap[i] = costs[i][0] - costs[i][1];
    }

    final sortedDiff = diffMap.keys.toList()..sort((a, b) => diffMap[a]!.compareTo(diffMap[b]!));

    int sum = 0;

    final halfLen = (costs.length / 2).toInt();
    for (int a = 0; a < halfLen; a++) sum += (costs[sortedDiff[a]][0]);
    for (int b = halfLen; b < costs.length; b++) sum += (costs[sortedDiff[b]][1]);
    return sum;
  }
}

void main() {
  final ans = Solution().twoCitySchedCost([
    [10, 20],
    [30, 200],
    [400, 50],
    [30, 20],
  ]);

  log("ans: $ans");
}
