class Solution {
  int getCommon(List<int> nums1, List<int> nums2) {
    if (nums2.length <= 0) return nums1[0];

    int left = 0;
    int right = 0;

    while (left < nums1.length && right < nums2.length) {
      final l = nums1[left];
      final r = nums2[right];
      if (l == r) {
        return l;
      }
      if (l > r) {
        right++;
        continue;
      } else {
        left++;
        continue;
      }
    }
    return -1;
  }
}
