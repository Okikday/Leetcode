// rookie solution
class Solution {
  List<int> twoSum(List<int> numbers, int target) {
    final end = numbers.length - 1;

    for (int i = 0; i < numbers.length; i++) {
      // target = 6
      final first = numbers[i]; // 2 at idx 0
      final second = target - first; // looking for 4
      final secondIdx = binarySearch(numbers, i + 1, end, second);
      if (secondIdx == -1) continue;
      return [i + 1, secondIdx + 1];
    }
    return const [1, 2];
  }

  int binarySearch(List<int> numbers, int start, int end, int find) {
    int left = start;
    int right = end;

    while (left <= right) {
      final mid = left + (right - left) ~/ 2;
      final midNum = numbers[mid];
      if (midNum == find) return mid;
      if (midNum < find) {
        left = mid + 1;
      } else if (midNum > find) {
        right = mid - 1;
      }
    }
    return -1;
  }
}

void main() {
  print(Solution().twoSum([-1, 0], -1));
}
