class Solution {
  bool isPalindrome(int x) {
    final xStr = x.toString();
    final bound = xStr.length ~/ 2;

    for (int i = 0; i < bound; i++) {
      if (xStr[i] != xStr[xStr.length - i - 1]) return false;
      continue;
    }
    return true;
  }
}
