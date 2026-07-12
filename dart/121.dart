class Solution {
  // rookie solution
  int maxProfit(List<int> prices) {
    if (prices.length < 2) return 0;

    int min = 10000;
    int calcMax = 0;

    for (final price in prices) {
      if (price < min) {
        min = price;
      } else {
        final diff = price - min;
        if (diff > calcMax) calcMax = diff;
      }
    }

    return calcMax;
  }
}
