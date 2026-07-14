import 'dart:core';

// rookie version
class Solution {
  bool isPalindrome(String s) {
    final str = <String>[];
    for (int i = 0; i < s.length; i++) {
      final curr = s[i];
      if (isAsciiAlphanumeric(curr)) str.add(curr.toLowerCase());
    }
    return str.join() == str.reversed.join();
  }

  bool isAsciiAlphanumeric(String text) {
    // Matches from start (^) to end ($) for only a-z, A-Z, and 0-9
    return RegExp(r'^[a-zA-Z0-9]+$').hasMatch(text);
  }
}
