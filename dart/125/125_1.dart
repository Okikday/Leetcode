import 'dart:core';

// improved rookie version
class Solution {
  bool isPalindrome(String s) {
    final str = <String>[];
    for (int i = 0; i < s.length; i++) {
      final curr = s[i];
      if (isAsciiAlphanumeric(curr)) str.add(curr.toLowerCase());
    }
    int left = 0;
    int right = str.length - 1;
    while (left <= right) {
      if (str[left] == str[right]) {
        left++;
        right--;
      } else {
        return false;
      }
    }
    return true;
  }

  bool isAsciiAlphanumeric(String text) {
    // Matches from start (^) to end ($) for only a-z, A-Z, and 0-9
    return RegExp(r'^[a-zA-Z0-9]+$').hasMatch(text);
  }
}

void main() {
  print(Solution().isPalindrome("A man, a plan, a canal: Panama"));
}
