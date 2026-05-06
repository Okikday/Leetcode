typedef StartFromPair = ({int rowIndex, int chIndex});

class Solution {
  bool exist(List<List<String>> board, String word) {
    if (board.isEmpty) {
      if (word.isEmpty) return true;
      return false;
    }
    if (board[0].isEmpty) return false;

    final width = board.first.length;
    final height = board.length;

    final usedIndexesTracker = List.generate(height, (i) => <int>{});
    final pathStack = <({int row, int ch})>[];

    bool dfs(int row, int ch, int wPos) {
      if (wPos == word.length) return true;
      if (row < 0 || row >= height || ch < 0 || ch >= width) return false;
      if (usedIndexesTracker[row].contains(ch)) return false;
      if (board[row][ch] != word[wPos]) return false;

      usedIndexesTracker[row].add(ch);
      pathStack.add((row: row, ch: ch));

      if (dfs(row, ch - 1, wPos + 1) ||
          dfs(row, ch + 1, wPos + 1) ||
          dfs(row - 1, ch, wPos + 1) ||
          dfs(row + 1, ch, wPos + 1)) {
        return true;
      }

      // Backtrack
      usedIndexesTracker[row].remove(ch);
      pathStack.removeLast();
      return false;
    }

    for (int r = 0; r < height; r++) {
      for (int c = 0; c < width; c++) {
        if (dfs(r, c, 0)) return true;
      }
    }

    return false;
  }
}

void main() {
  print(
    "${Solution().exist([
      ["A", "B", "C", "E"],
      ["S", "F", "C", "S"],
      ["A", "D", "E", "E"],
    ], "ABCCED")}",
  );
}
