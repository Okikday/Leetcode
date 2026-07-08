/// Third solution (2ms)
class Solution {
  int sumAndMultiply(int n) {
    int sum = 0;
    int accDigit = 0;

    final nStr = n.toString();

    for (int i = 0; i < nStr.length; i++) {
      final pos = nStr[i];

      if (pos == '0') continue;
      int digit = int.parse(pos);

      sum += digit;
      accDigit = (accDigit * 10) + digit;
    }

    return accDigit * sum;
  }
}
