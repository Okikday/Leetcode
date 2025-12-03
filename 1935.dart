class Solution {
  int canBeTypedWords(String text, String brokenLetters) {
    final splittedWords = text.split(' ').asMap();
    final brokenLettersMap = brokenLetters.split('').asMap();
    int count = 0;
    splittedWords.values.forEach((item) {
      for (final i in brokenLettersMap.values) {
        if (item.contains(i)) {
          count++;
          break;
        }
      }
    });
    return splittedWords.length - count;
  }
}

void main() {
  final Stopwatch sw = Stopwatch()..start();
  print("${Solution().canBeTypedWords("Hello majn", "ej")}");
  sw.stop();
  print("${sw.elapsed}");
}
