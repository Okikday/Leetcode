import 'dart:math' as math;

class Solution {
  String longestPalindrome(String s) {
    final sPrime = [];
    for (int i = 0; i < s.length; i++) {
      if (i == 0) sPrime.add('#');
      sPrime.add(s[i]);
      sPrime.add('#');
    }

    final n = sPrime.length;
    final palindromeRadii = List.filled(n, 0);
    int center = 0;
    int radius = 0;

    for (int i = 0; i < n; i++) {
      final mirror = 2 * center - i;

      if (i < radius) {
        palindromeRadii[i] = math.min(radius - i, palindromeRadii[mirror]);
      }
      while (i + 1 + palindromeRadii[i] < n &&
          i - 1 - palindromeRadii[i] >= 0 &&
          sPrime[(i + 1 + palindromeRadii[i])] == sPrime[(i - 1 - palindromeRadii[i])]) {
        palindromeRadii[i]++;
      }
      final m = i + palindromeRadii[i];
      if (m > radius) {
        center = i;
        radius = m;
      }
    }

    int maxLength = 0;
    int centerIndex = 0;
    for (int i = 0; i < n; i++) {
      if (palindromeRadii[i] > maxLength) {
        maxLength = palindromeRadii[i];
        centerIndex = i;
      }
    }

    int startIndex = (centerIndex - maxLength) ~/ 2;
    String longestPalindrome = s.substring(startIndex, startIndex + maxLength);

    return longestPalindrome;
  }
}

void main() {
  final stopWatch = Stopwatch()..start();
  print("${Solution().longestPalindrome('babad')}");
  stopWatch.stop();
  print("${stopWatch.elapsedMilliseconds}");
}
