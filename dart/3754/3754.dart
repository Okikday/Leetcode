import 'dart:math' as math;

/// First Solution (9ms)
class Solution {
  int sumAndMultiply(int n) {
    if (n == 0) return 0;
    final digitList = <int>[];
    final nLen = (math.log(n) / math.log(10)).round() + 1;

    for (int i = nLen; i > 0; i--) {
      final j = math.pow(10, i);

      final firstDigit = (n % j) ~/ (j / 10);

      if (firstDigit != 0) digitList.add(firstDigit);
    }

    final sum = digitList.fold<int>(0, (i, v) => i + v);
    final digit = int.parse(digitList.join());
    return digit * sum;
  }
}
