class Solution {
  List<List<int>> threeSum(List<int> nums) {
    nums.sort();
    final res = <List<int>>[];

    for (int i = 0; i < nums.length - 2; i++) {
      if (i > 0 && nums[i] == nums[i - 1]) continue;

      int left = i + 1;
      int right = nums.length - 1;

      while (left < right) {
        final sum = nums[i] + nums[left] + nums[right];

        if (sum == 0) {
          res.add([nums[i], nums[left], nums[right]]);
          left++;
          right--;

          // skip duplicates
          while (left < right && nums[left] == nums[left - 1]) left++;
          while (left < right && nums[right] == nums[right + 1]) right--;
        } else if (sum < 0) {
          left++;
        } else
          right--;
      }
    }
    return res;
  }
}
