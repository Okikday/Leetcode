class Solution {
  bool check(List<int> nums) {
    final head = 0;
    final tail = nums.length - 1;
    int max = tail;

    while (nums[tail] <= nums[head] && max >= 0) {
      final tmp = nums[tail];

      nums.removeAt(tail);
      nums.insert(head, tmp);
      max--;
    }

    for (int i = 1; i <= tail; i++) {
      if (nums[i - 1] > nums[i]) {
        return false;
      }
    }

    return true;
  }
}

// void main() {
//   print("${Solution().check([3, 2, 1])}");
// }
