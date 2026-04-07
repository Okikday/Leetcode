class Solution {
  int removeElement(List<int> nums, int val) {
    int pos = 0;

    for (int i = 0; i < nums.length; i++) {
      if (nums[i] != val) {
        nums[pos] = nums[i];
        pos++;
      }
    }

    return pos;
  }
}

void main() {
  print("${Solution().removeElement([3, 2, 2, 3], 3)}");
}
