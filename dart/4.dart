class Solution {
  double findMedianSortedArrays(List<int> nums1, List<int> nums2) {
    final newArr = List<int>.from(nums1)
      ..addAll(nums2)
      ..sort();
    return (newArr.fold(0, (a, b) => a + b) / newArr.length);
  }
}

void main() {
  final sol = Solution().findMedianSortedArrays([1, 2], [3, 4]).toStringAsFixed(5);
  print("sol: $sol");
}

//[2,2,4,4] // num1
//[2,2,2,4,4]
//
