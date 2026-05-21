import 'dart:math' as math;

typedef DigitAndLen = (int digit, int len);

class Solution {
  int longestCommonPrefix(List<int> arr1, List<int> arr2) {
    if (arr1.isEmpty || arr2.isEmpty) return 0;

    int highest = 0;

    for (int i = 0; i < arr1.length; i++) {
      final a = arr1[i];
      for (final b in arr2) {
        final aLen = digitLength(a);
        final bLen = digitLength(b);

        // Case 1: Checking that they are equal;
        if (aLen == bLen && a == b) {
          if (highest < aLen) highest = aLen;
          continue;
        }

        final DigitAndLen hi;
        final DigitAndLen lo;
        if (aLen > bLen) {
          hi = (a, aLen);
          lo = (b, bLen);
        } else {
          hi = (b, bLen);
          lo = (a, aLen);
        }

        final dBoost = lo.$1 * math.pow(10, hi.$2 - lo.$2).toInt();

        if (hi.$1 == dBoost) {
          highest = lo.$2;
          continue;
        } else {
          final diffLen = digitLength((hi.$1 - dBoost).abs());

          if (diffLen == hi.$2) {
            continue;
          } else {
            final newestCommon = hi.$2 - diffLen - 1;
            if (highest < newestCommon) highest = newestCommon;
            continue;
          }
        }
      }
    }

    return highest;
  }

  int digitLength(int digit) => digit.abs().toString().length;
}

// void main() {
//   print("${Solution().longestCommonPrefix([10], [17, 11])}");
// }
