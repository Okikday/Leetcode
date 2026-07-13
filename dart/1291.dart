import "dart:math" as math;

class Solution {
  // Let's use an example. low = 1000, high = 13000
  List<int> sequentialDigits(int low, int high) {
    final seqList = <int>[];
    final lowLen = digitLength(low); // 4
    final hiLen = digitLength(high); // 5

    final steps = hiLen - lowLen + 1; // 2 steps

    // print("lowLen: $lowLen");

    for (int a = 0; a < steps; a++) {
      final maxIncrements = lowLen + a - 1;
      final lenBound = maxIncrements + 1;

      final lowBound = a == 0
          ? low
          : math.pow(10, maxIncrements).toInt(); // 1000, 10000

      final firstDigit = nthDigit(lowBound, lenBound, 0);

      // print(
      //   "step: $a, firstDigit: $firstDigit, lowerBound: $lowBound, maxLength. $lenBound",
      // );

      final maxBound = firstDigit + maxIncrements;

      if (maxBound > 9) {
        // print("skipped $a\n");
        continue;
      }

      // todo: left to handle first naturally following number

      int startDigit = firstDigit;

      while (startDigit + maxIncrements < 10) {
        int seqDigit = 0;
        // print("startDigit: $startDigit");
        for (int b = 0; b <= maxIncrements; b++) {
          final n = startDigit + b;
          seqDigit += (n * math.pow(10, maxIncrements - b).toInt());
        }
        if (seqDigit < lowBound) {
          startDigit++;
          continue;
        }
        if (seqDigit > high) break;
        seqList.add(seqDigit);
        // print("added digit: $seqDigit...");
        startDigit++;
        // print("would encounter maxBound: $maxBound\n");
      }
    }

    return seqList;
  }

  int digitLength(int number) =>
      number == 0 ? 1 : (math.log(number.abs()) / math.log(10)).floor() + 1;

  int nthDigit(int digit, int len, int nth) =>
      ((digit ~/ math.pow(10, len - nth - 1)) % 10).toInt();
}

void main() {
  // print(Solution().sequentialDigits(58, 155));
}
