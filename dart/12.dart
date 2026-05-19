import 'dart:math' as math;

const romanSymbols = <int, String>{1: 'I', 5: 'V', 10: 'X', 50: 'L', 100: 'C', 500: 'D', 1000: 'M'};

class Solution {
  String intToRoman(int digit) {
    if (digit.isNegative) return '';

    final dupKeys = romanSymbols.keys.toList();
    int posIndex = romanSymbols.length - 1;
    String str = '';

    while (posIndex >= 0) {
      final resolve4or9Result = resolveStartsWith(digit, dupKeys, [9, 4]);
      if (resolve4or9Result != null) {
        str += resolve4or9Result.roman;
        digit = resolve4or9Result.rem;
        posIndex--;
        continue;
      }
      final factor = dupKeys[posIndex];
      final times = digit ~/ factor;
      if (times == 0) {
        posIndex--;
        continue;
      }
      final rem = digit % factor;
      str += "${romanSymbols[factor]}" * times;
      posIndex--;
      digit = rem;
    }
    return str;
  }

  int digitLength(int digit) => digit == 0 ? 1 : (math.log(digit.abs()) / math.log(10)).truncate() + 1;

  int firstDigit(int digit, int times) => digit ~/ times.toInt();

  ({String roman, int rem})? resolveStartsWith(int digit, List<int> keys, List<int> digitsToCheck) {
    final factor = math.pow(10, digitLength(digit) - 1).toInt();
    final firstDigit = this.firstDigit(digit, factor);

    for (final check in digitsToCheck) {
      if (firstDigit == check) {
        final roundDigit = (firstDigit * factor);
        return (
          roman: (romanSymbols[factor] ?? '') + (romanSymbols[(factor + roundDigit)] ?? ''),
          rem: digit - roundDigit,
        );
      }
    }
    return null;
  }
}

void main() {
  print("resolved: ${Solution().intToRoman(1994)}");
}
