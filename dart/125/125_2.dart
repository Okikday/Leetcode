// import 'dart:core';

// // improved rookie version
// class Solution {
//   bool isPalindrome(String s) {
//     int left = 0;
//     int right = s.length - 1;
//     while (left <= right) {
//       final same = s[left].toLowerCase() == s[right].toLowerCase();

//       if (same) {
//         left++;
//         right--;
//         continue;
//       }
//       while (!isAsciiAlphanumeric(s[left])) left++;
//       while (!isAsciiAlphanumeric(s[right])) right--;
//       if (s[left].toLowerCase() != s[right].toLowerCase()) return false;
//     }

//     return true;
//   }

//   bool isAsciiAlphanumeric(String text) {
//     // Matches from start (^) to end ($) for only a-z, A-Z, and 0-9
//     return RegExp(r'^[a-zA-Z0-9]+$').hasMatch(text);
//   }
// }

import 'dart:core';

class Solution {
  bool isPalindrome(String s) {
    final str = <String>[];
    for (int i = 0; i < s.length; i++) {
      final curr = s[i];
      if (isAsciiAlphanumericChar(curr)) str.add(curr.toLowerCase());
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

  bool isAsciiAlphanumericChar(String char) {
    if (char.isEmpty) return false;
    int code = char.codeUnitAt(0);

    return (code >= 48 && code <= 57) || // 0-9
        (code >= 65 && code <= 90) || // A-Z
        (code >= 97 && code <= 122); // a-z
  }
}

void main() {
  print(Solution().isPalindrome(" "));
}
