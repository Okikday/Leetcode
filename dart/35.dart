class Solution {
  int searchInsert(List<int> nums, int target) {
    return binarySearch(nums, target);
  }

  int binarySearch(List<int> nums, int target) {
    final len = nums.length;
    if (len < 2) {
      if (nums[0] != target)
        if (nums[0] < target)
          return 1;
        else
          return 0;
      else
        return 0;
    }
    if (nums[0] == target) return 0;
    if (nums[len - 1] == target) return len - 1;

    int found = -1;
    int lo = 0;
    int hi = len - 1;
    for (int i = 0; i < len; i++) {
      final index = (hi + lo) ~/ 2;
      if (nums[index] < target) {
        lo = index;
        continue;
      } else if (nums[index] > target) {
        hi = index;
        continue;
      } else {
        if (nums[index] == target) {
          found = index;
          break;
        }
        continue;
      }
    }
    if (found == -1)
      if (target > lo)
        return lo + 1;
      else if (target > hi)
        return hi + 1;
      else if (target < lo)
        return lo;
      else if (target < hi)
        return hi;
    return found;
  }
}

void main() {
  print(Solution().searchInsert([1, 3, 5, 6], 0));
}
