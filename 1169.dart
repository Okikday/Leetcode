import 'dart:collection';

class Solution {
  // Time: O(transactions.length^2), worst case is when all transactions have the same name and amounts are <=1000, for each we iterate through every transaction
  // Space: O(transactions.length), worst case is when all transactions have a unique name so each of them has a separate entry in the map
  List<String> invalidTransactions(List<String> transactions) {
    // map transaction name to all transactions with that name
    final map = new HashMap<String, List<String>>();

    for (final currTransaction in transactions) {
      final splitTransaction = currTransaction.split(",");

      map.putIfAbsent(splitTransaction[0], () => []); // add list for the name if it doesn't exist

      map[splitTransaction[0]]?.add(splitTransaction.join(',')); // add current transaction to appropriate list
    }

    final result = <String>[];

    // every loop checks if the currTransaction is invalid
    for (final currTransaction in transactions) {
      final currSplitTransaction = currTransaction.split(",");

      if (int.parse(currSplitTransaction[2]) > 1000) {
        result.add(currTransaction);
      } else {
        // iterate through all transactions with the same name, check if within 60 minutes and different city
        final mapTransaction = map[currSplitTransaction[0]];
        if (mapTransaction != null) {
          for (final curr in mapTransaction) {
            if ((int.parse(currSplitTransaction[1]) - int.parse(curr[1])).abs() <= 60 &&
                !(currSplitTransaction[3] == curr[3])) {
              result.add(currTransaction);
              break;
            }
          }
        }
      }
    }

    return result;
  }
}

void main() {
  print(
    "Solution: ${Solution().invalidTransactions(["alice,20,800,mtv", "alice,50,100,mtv", "alice,51,100,frankfurt"])}",
  );
}
