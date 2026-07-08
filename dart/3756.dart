const modValue = 1000000007;

class Solution {
  List<int> sumAndMultiply(String s, List<List<int>> queries) {
    if (s.isEmpty) return const [];
    return [for (final q in queries) _sumAndMultiply(s, q.first, q.last)];
  }

  int _sumAndMultiply(String s, int fro, int to) {
    if (fro > to) return 0;
    int sum = 0;
    int accDigit = 0;

    // Case 1: iterations greater than 10
    if (to - fro <= 10) {
      for (int i = fro; i <= to; i++) {
        final pos = s[i];

        if (pos == '0') continue;
        final digit = int.parse(pos);

        sum = (sum + digit) % modValue;
        accDigit = (((accDigit * 10) % modValue) + digit) % modValue;
      }
    } else {
      final buffer = StringBuffer();
      for (int i = fro; i <= to; i++) {
        final pos = s[i];

        if (pos == '0') continue;
        final digit = int.parse(pos);

        sum = (sum + digit);
        buffer.write(pos);
      }
      return (num.parse(buffer.toString()).toInt() * sum) % modValue;
    }

    return (accDigit * sum) % modValue;
  }
}

void main() {
  print(
    Solution().sumAndMultiply("9223538386222334255", [
      [0, 0],
      [0, 2],
      [0, 3],
      [0, 4],
      [0, 5],
      [0, 8],
      [0, 9],
      [0, 10],
      [0, 11],
      [0, 13],
      [0, 16],
      [0, 18],
      [1, 1],
      [1, 2],
      [1, 3],
      [1, 5],
      [1, 7],
      [1, 8],
      [1, 12],
      [1, 14],
      [1, 16],
      [1, 18],
      [2, 3],
      [2, 6],
      [2, 9],
      [2, 15],
      [2, 16],
      [2, 18],
      [3, 3],
      [3, 4],
      [3, 6],
      [3, 7],
      [3, 8],
      [3, 10],
      [3, 15],
      [3, 17],
      [4, 8],
      [4, 9],
      [4, 11],
      [4, 14],
      [4, 16],
      [5, 9],
      [5, 11],
      [5, 12],
      [5, 16],
      [5, 17],
      [5, 18],
      [6, 8],
      [6, 17],
      [6, 18],
      [7, 8],
      [7, 9],
      [7, 10],
      [7, 13],
      [7, 14],
      [7, 15],
      [7, 16],
      [8, 17],
      [8, 18],
      [9, 13],
      [10, 10],
      [10, 11],
      [10, 13],
      [10, 14],
      [10, 15],
      [10, 18],
      [11, 14],
      [11, 15],
      [12, 15],
      [12, 17],
      [13, 14],
      [13, 16],
      [13, 17],
      [14, 15],
      [14, 18],
      [15, 18],
    ]),
  );
}
