class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);

  static ListNode? fromList(List<int> result) {
    if (result.isEmpty) return null;
    if (result.length == 1) return ListNode(result.first);

    ListNode? node;
    for (int i = result.length - 1; i >= 0; i--) {
      node = (i == result.length - 1) ? ListNode(result[i]) : ListNode(result[i], node);
    }

    return node;
  }

  List<int> toList() {
    ListNode? node = this;
    List<int> list = [];

    // Turn them into list for easier access and computation
    while (true) {
      if (node != null) {
        list.add(node.val);
        node = node.next;
      }

      if (node == null) break;
    }
    return list;
  }
}

class Solution {
  ListNode? fromList(List<int> result) {
    if (result.isEmpty) return null;
    if (result.length == 1) return ListNode(result.first);

    ListNode? node;
    for (int i = result.length - 1; i >= 0; i--) {
      node = (i == result.length - 1) ? ListNode(result[i]) : ListNode(result[i], node);
    }

    return node;
  }

  ListNode? addTwoNumbers(ListNode? l1, ListNode? l2) {
    if (l1 == null || l2 == null) return null;

    int count = 0;
    List<int> result = [];
    while (true) {
      resolveAddition(result, count, (l1?.val ?? 0) + (l2?.val ?? 0));
      l1 = l1?.next;
      l2 = l2?.next;
      count++;
      if (l1 == null && l2 == null) break;
    }

    return fromList(result);
  }

  void resolveAddition(List<int> result, int index, int numToAdd) {
    final existingNumber = result.elementAtOrNull(index) ?? 0;
    // print("existing: $existingNumber");
    final calc = existingNumber + numToAdd;
    if (calc < 10) {
      if (existingNumber != 0) result.removeLast();
      result.add(calc);
    } else {
      if (existingNumber != 0) result.removeLast();
      final leftDigit = calc ~/ 10;
      final rightDigit = calc % 10;
      result.add(rightDigit);
      result.add(leftDigit);
    }
  }
}

void main() {
  print("${Solution().addTwoNumbers(ListNode.fromList([2, 4, 3]), ListNode.fromList([5, 6, 4]))?.toList()}");
  // print("${ListNode.fromList([2, 3, 4])?.toList()}");
}



/*
class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);

  static ListNode? fromList(List<int> result) {
    if (result.isEmpty) return null;
    if (result.length == 1) return ListNode(result.first);

    ListNode? node;
    for (int i = result.length - 1; i >= 0; i--) {
      node = (i == result.length - 1) ? ListNode(result[i]) : ListNode(result[i], node);
    }

    return node;
  }

  List<int> toList() {
    ListNode? node = this;
    List<int> list = [];

    // Turn them into list for easier access and computation
    while (true) {
      if (node != null) {
        list.add(node.val);
        node = node.next;
      }

      if (node == null) break;
    }
    return list;
  }
}

class Solution {
  ListNode? fromList(List<int> result) {
    if (result.isEmpty) return null;
    if (result.length == 1) return ListNode(result.first);

    ListNode? node;
    for (int i = result.length - 1; i >= 0; i--) {
      node = (i == result.length - 1) ? ListNode(result[i]) : ListNode(result[i], node);
    }

    return node;
  }

  ListNode? addTwoNumbers(ListNode? l1, ListNode? l2) {
    if (l1 == null || l2 == null) return null;
    List<int> list1 = [];
    List<int> list2 = [];

    // Turn them into list for easier access and computation
    while (true) {
      if (l1 != null) {
        list1.add(l1.val);
        print("val: ${l1.val}");
        l1 = l1.next;
      }
      if (l2 != null) {
        list2.add(l2.val);
        l2 = l2.next;
      }

      if (l1 == null && l2 == null) break;
    }

    // print("list1: $list1");
    // print("list2: $list2");

    // size of the longer list to be set
    int iterationsCount = 0;

    // size of the shorterList
    List<int> shorterList = [];
    final longerList = () {
      final len1 = list1.length;
      final len2 = list2.length;
      iterationsCount = math.max(len1, len2);
      if (list1.length > list2.length) {
        shorterList = list2;
        return list1;
      } else {
        shorterList = list1;
        return list2;
      }
    }();

    List<int> result = [];

    for (int i = 0; i < iterationsCount; i++) {
      final first = longerList[i];
      final second = tryGetAtIndex(shorterList, i);
      final calc = first + second;
      print("calculation $i: $first + $second");
      resolveAddition(result, i, calc);
    }

    return fromList(result);
  }

  void resolveAddition(List<int> result, int index, int numToAdd) {
    final existingNumber = tryGetAtIndex(result, index);
    final calc = existingNumber + numToAdd;
    if (calc < 10) {
      if (existingNumber != 0) result.removeLast();
      result.add(calc);
    } else {
      if (existingNumber != 0) result.removeLast();
      final leftDigit = calc ~/ 10;
      final rightDigit = calc % 10;
      result.add(rightDigit);
      result.add(leftDigit);
    }
  }

  int tryGetAtIndex(List<int> list, int index) {
    try {
      final num = list[index];
      return num;
    } catch (e) {
      return 0;
    }
  }
}
*/