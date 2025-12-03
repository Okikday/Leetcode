import "dart:math" as math;

class Solution {
  int romanToInt(String s) {
    final List<String> romanLettersList = ['I', 'V', 'X', 'L', 'C', 'D', 'M'];
    // final Map<int, String> romanLetters = romanLettersList.asMap();

    if (s.length < 1 || s.length > 15) return 0;

    final patternX = 1;
    final patternY = 5;
    final splittedS = s.split('');

    int romanInNumberResult = 0;
    splittedS.forEach((e) {
      final index = romanLettersList.indexOf(e);
      romanInNumberResult += getRomanValMultiplier(index) * (!isOdd(index) ? patternX : patternY);
    });

    return romanInNumberResult;
  }

  int getRomanValMultiplier(int index) => math.pow(10, index ~/ 2).toInt();

  handleBiggerRecursively(List<String> romanLettersList, List<String> splittedS) {
    // int lastBiggestNumIndex = romanLettersList.length - 1;
    List<String> moddedSplittedS = splittedS;
    romanLettersList.indexOf(moddedSplittedS.first);
  }

  bool isOdd(int number) {
    if (number < 0) return false; // handle separately later
    if (number % 2 == 0) return false;
    return true;
  }
}

void main() {
  print("${Solution().romanToInt("L")}");
}
