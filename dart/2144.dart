class Solution {
  int minimumCost(List<int> cost) {
    cost.sort();
    int accummulatedCost = 0;
    int tracker = 2;
    for (int i = cost.length - 1; i >= 0; i--) {
      if (tracker == 0) {
        tracker = 2;
        continue;
      }
      tracker--;
      accummulatedCost += cost[i];
    }
    return accummulatedCost;
  }
}

void main() {
  final cost = [5, 5];
  print("${Solution().minimumCost(cost)}");
}
