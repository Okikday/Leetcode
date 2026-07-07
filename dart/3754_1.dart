import 'dart:math' as math;

/// Second Solution (4ms)
class Solution {
  int sumAndMultiply(int n) {
    if (n == 0) return 0;

    final nLen = (math.log(n) / math.log(10)).round() + 1;

    int sum = 0;
    int accDigit = 0;

    for (int i = nLen; i > 0; i--) {
      final j = math.pow(10, i);

      final digit = (n % j) ~/ (j / 10);

      if (digit != 0) {
        sum += digit;
        accDigit = ((accDigit * 10) + digit);
      }
    }

    return accDigit * sum;
  }
}

void main() {
  print("${Solution().sumAndMultiply(1000)}");
}
