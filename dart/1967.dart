class Solution {
  int numOfStrings(List<String> patterns, String word) {
    return patterns.fold(0, (c, v) => c + (word.contains(v) ? 1 : 0));
  }
}
