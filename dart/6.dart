import 'dart:math' as math;

class Solution {
  String convert(String s, int numRows) {
    // Map of <Column, diagonal>
    List<List<String>> zigList = [];
    final splittedS = s.split('');
    final sLen = s.length;

    // The length of chars you can fit in a zig
    final zigLen = numRows <= 2 ? (numRows - 1) : (numRows ~/ 2);

    // The number of characters you can fit in one Column and a zigzag before the next one.
    final normSpace = numRows + zigLen;

    // The number of times you can fill a "column" and a "zigzag before the next column".
    final absIterationCount = sLen ~/ (numRows <= 2 ? numRows : normSpace);

    // The remaining character when you run out of fully filling a column and zigzag (to be resolved)
    final remainingChars = sLen % (numRows <= 2 ? numRows : normSpace);

    // Deal with absolute characters (containes column and it's next zigzag)
    if (numRows <= 2) {
      for (int i = 0; i < absIterationCount; i++) {
        final listLen = (i * numRows);
        final list = splittedS.sublist(listLen, listLen + numRows);
        zigList.add(list);
      }
    } else {
      for (int i = 0; i < absIterationCount; i++) {
        final listLen = i * normSpace;
        final list = splittedS.sublist(listLen, listLen + normSpace);
        zigList.add(list);
      }
    }

    print("normSpace: $normSpace");
    print("absIte: $absIterationCount");
    print("remIte: $remainingChars");
    print("gotten yet: $zigList");

    // Append with the characters left
    if (remainingChars > 0) {
      if (numRows <= 2) {
        zigList.add(splittedS.sublist(absIterationCount * numRows));
      } else {
        final remStrLen = absIterationCount * normSpace;
        zigList.add(splittedS.sublist(remStrLen, remStrLen + remainingChars));
      }
    }

    final maxIterations = zigList.fold(0, (a, b) => math.max(a, b.length));
    print("maxIterations: $maxIterations");

    print("Sorted str: $zigList");

    List<String> result = [];
    int col = 0;

    if (zigList.length == 1) {
      if (maxIterations <= numRows)
        result.addAll(zigList[0]);
      else {
        final onlyList = zigList[0];
        final rem = onlyList.length / numRows;
      }
    } else {
      for (int total = 0; total < maxIterations; total++) {
        final zigListLen = zigList.length;

        for (int row = 0; row < zigListLen; row++) {
          final innerZig = zigList[row];
          if (col > zigListLen) print("row: $row, col: $col, in LIST: $innerZig");
          print("suf[$col][$row]");

          final innerZigLen = innerZig.length;

          final pre =
              col > (innerZigLen / 2).ceil() ||
                  (innerZigLen > 2 && col == innerZigLen - 1) ||
                  (innerZigLen == 1 && col == innerZigLen)
              ? null
              : innerZig[col];
          final suf = col == 0 || col > ((innerZigLen - 1) / 2).floor() ? null : innerZig[innerZigLen - col];

          if (pre != null) result.add(pre);
          print("Added pre: $pre");

          if (suf != null) result.add(suf);
          print("Added suf: $suf");
        }

        col++;
      }
    }
    print("result: $result");
    return result.join();
  }
}

void main() {
  Solution().convert("ABCDE", 4);
}
