import 'dart:collection';

class Solution {
  int lengthOfLongestSubstring(String s) {
    if (s.isEmpty) return 0;
    if (s.trim().isEmpty) return 1;
    final LinkedHashSet<String> lswrc = LinkedHashSet();
    List<List<String>> lastValidList = List.empty(growable: true);
    final splittedS = s.split('');
    for (int i = 0; i < splittedS.length; i++) {
      final currPos = splittedS[i];

      if (lswrc.contains(currPos)) {
        for (final e in lswrc.toList()) {
          if (e == currPos) {
            lswrc.remove(e);
            break;
          }
          lswrc.remove(e);
        }
        lswrc.add(currPos);
        // end
      } else {
        lswrc.add(currPos);
        print("Added c");
      }
      //   print("I'm about to add $lswrc");
      lastValidList.add(lswrc.toList());
      //   print("iteration $i: $lswrc");
    }

    int highestIndex = lastValidList.isEmpty ? lswrc.length : lastValidList.first.length;
    for (final e in lastValidList) {
      if (highestIndex < e.length) {
        highestIndex = e.length;
      }
    }
    print("${lastValidList}");
    return highestIndex;
  }
}

void main() {
  print("${Solution().lengthOfLongestSubstring("abcabcbb")}");
}
