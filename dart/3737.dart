class Solution {
  int countMajoritySubarrays(List<int> nums, int target) {
    final int n = nums.length;
    final int offset = n + 1;
    final bit = List<int>.filled(2 * n + 2, 0);

    void add(int index, int val) {
      for (; index < bit.length; index += index & -index) {
        bit[index] += val;
      }
    }

    int query(int index) {
      int sum = 0;
      for (; index > 0; index -= index & -index) {
        sum += bit[index];
      }
      return sum;
    }

    int subArrCount = 0;
    int currentPrefix = 0;

    add(0 + offset, 1);

    for (int i = 0; i < n; i++) {
      int val = (nums[i] == target) ? 1 : -1;
      currentPrefix += val;

      subArrCount += query(currentPrefix - 1 + offset);

      add(currentPrefix + offset, 1);
    }

    return subArrCount;
  }
}

void main() {
  final ans = Solution().countMajoritySubarrays([6, 9, 10, 10, 5], 10);
  print(ans);
}
