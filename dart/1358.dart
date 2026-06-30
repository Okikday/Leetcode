import 'dart:math' as math;

class Solution {
  int numberOfSubstrings(String s) {
    int count = 0;
    int recentA = -1, recentB = -1, recentC = -1;

    for (int i = 0; i < s.length; i++) {
      if (s[i] == 'a')
        recentA = i;
      else if (s[i] == 'b')
        recentB = i;
      else if (s[i] == 'c')
        recentC = i;

      if (recentA != -1 && recentB != -1 && recentC != -1) {
        count += 1 + math.min(recentA, math.min(recentB, recentC));
      }
    }

    return count;
  }
}

void main() {
  print(Solution().numberOfSubstrings("aaacb"));
}
