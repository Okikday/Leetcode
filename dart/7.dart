import 'dart:math' as math;

class Solution {
  int reverse(int x) {
    final isNegative = x.isNegative;
    if (x <= -math.pow(2, 31) || x > math.pow(2, 31) - 1 || x.bitLength > 31) return 0;
    if (x.abs() < 10) return x;

    x = x.abs();

    final list = <int>[];
    while (true) {
      list.add(x % 10);
      x = x ~/ 10;
      if (x < 10) {
        list.add(x % 10);
        break;
      }
    }

    final result = (int.tryParse(list.join()) ?? 0) * (isNegative ? -1 : 1);
    if (result < -math.pow(2, 31) || result > math.pow(2, 31) - 1) return 0;

    return result;
  }
}

void main() {
  print("${(-2147483648).bitLength}");
  // final sw = Stopwatch()..start();
  // print("${Solution().reverse(-2147483648)}");
  // sw.stop();
  // print("Time elapsed: ${sw.elapsedMicroseconds}mis");
}
