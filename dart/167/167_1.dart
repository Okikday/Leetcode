class Solution {
  List<int> twoSum(List<int> numbers, int target) {
    int left = 0;
    int right = numbers.length - 1;

    while (left < right) {
      final sum = numbers[left] + numbers[right];
      if (sum == target) return [left + 1, right + 1];
      if (sum < target)
        left++;
      else
        right--;
    }
    return const [];
  }
}
