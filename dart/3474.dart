import 'dart:developer';

class Solution {
  String generateString(String str1, String str2) {
    final n = str1.length;
    final m = str2.length;

    final List<String?> word = List.filled(n + m - 1, null);
    final wordLen = word.length;

    final str1List = str1.split('');
    final str2List = str2.split('');

    List<int> fIndexes = []; // Store the F indexes for faster access next time

    // Iterate through the str1 string
    for (int i = 0; i < str1.length; i++) {
      // (i >= 0) and (i <= n-1)

      // Reserve the F(s) for later and skip
      if (str1List[i] == 'F') {
        fIndexes.add(i);
        continue;
      }

      // bounds are from current [i] to [i + m] e.g, For a str2 = "ab" at position i = 0 would be from 0 to 1
      for (int j = 0; j < m; j++) {
        final fillPos = i + j;
        if (fillPos > wordLen - 1) break; // If the position to fill exceeds bounds

        if (word[fillPos] == null) {
          word[fillPos] = str2List[j];
        } else {
          if (word[fillPos] != str2List[j]) return "";
          continue;
        }
      }
    }

    for (final f in fIndexes) {
      if (word[f] != null) {
        int trackEqual = 0;
        for (int j = 0; j < m; j++) {
          final fillPos = f + j;
          if (word[fillPos] == str2List[j]) {
            trackEqual++;
            continue;
          }
        }
        if (trackEqual == m) return "";
      } else {
        // log("Unexpectedly detected null");
      }
    }

    final startNullFillIndex = word.indexWhere((t) => t == null);

    int str2Offset = 0;
    for (int a = 0; a < wordLen - startNullFillIndex; a++) {
      final offset = a + startNullFillIndex;
      if (word[offset] == null) {
        word[offset] = str2List[str2Offset];
        if (str2Offset == m - 1) {
          str2Offset = 0;
        } else {
          str2Offset++;
        }
      } else {
        // reset
        str2Offset = 0;
      }
    }

    return word.join();
  }
}

void main() {
  final sol = Solution().generateString("F", "d");
  log("Answer: $sol");
}
