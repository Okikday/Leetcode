/// Looking for an improved solution
class Solution {
  int getCommon(List<int> nums1, List<int> nums2) {
    if (nums2.length <= 0) return nums1[0];
    if (nums1[0] == nums2[0]) return nums1[0];

    final baseNums = nums1[0] < nums2[0] ? nums1 : nums2;
    final cmpNums = nums1[0] > nums2[0] ? nums1 : nums2;

    for (final a in baseNums) {
      if (binarySearch(cmpNums, a) != -1) return a;
    }
    return -1;
  }

  int binarySearch(List<int> sortedList, int target) {
    int left = 0;
    int right = sortedList.length - 1;

    while (left <= right) {
      int mid = left + (right - left) ~/ 2;

      if (sortedList[mid] == target) {
        return mid; // Target found, return its index
      } else if (sortedList[mid] < target) {
        left = mid + 1; // Target is in the right half
      } else {
        right = mid - 1; // Target is in the left half
      }
    }

    return -1;
  }
}

void main() {
  print("${Solution().getCommon([1, 2, 3, 6], [2, 3, 4, 5])}");
}
