class Solution {
  String longestCommonPrefix(List<String> strs) {
    final wordsCount = strs.length;
    if (wordsCount == 1) return strs[0];
    if (wordsCount < 2) return "";

    final Set<String> buffer = Set();
    final firstWord = strs[0];
    bool breakout = false;
    for (int a = 0; a < firstWord.length; a++) {
      if (breakout) break;
      for (int i = 0; i < wordsCount; i++) {
        if (i == wordsCount - 1) {
          buffer.add(strs[i][a]);
          break;
        }
        final firstWord = strs[i];
        final secondWord = strs[i + 1];

        if (secondWord.length - 1 < a || firstWord.length - 1 < a) break;
        final letterA = firstWord[a];
        final letterB = secondWord[a];
        if (letterA != letterB) {
          breakout = true;
          break;
        }
      }
    }
    return buffer.join().toString();
  }
}

void main() {
  Solution().longestCommonPrefix(["cir", "car"]);
}
