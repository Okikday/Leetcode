class Solution {
  List<int> twoSum(List<int> nums, int target) {
    final map = <int, int>{};

    for (int i = 0; i < nums.length; i++) {
      final complement = target - nums[i];
      if (map[complement] != null) {
        return [map[complement]!, i];
      }
      map[nums[i]] = i;
    }

    return [];
  }
}
