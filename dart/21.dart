class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

class Solution {
  ListNode? mergeTwoLists(ListNode? list1, ListNode? list2) {
    if (list1 == null && list2 == null) return null;
    if (list1 == null) return list2!.newThis();
    if (list2 == null) return list1.newThis();

    final first = list1.copy();
    final firstNodeStart = first.start;
    // final firstEndPointer = first.end;
    final secondNode = list2.newThis();

    first.end.next = secondNode;

    final totalList = firstNodeStart.toList();

    quickSort(totalList, 0, totalList.length - 1);

    return toListNode(totalList);
  }
}

void main() {
  final list1 = ListNode(2);
  final list2 = ListNode(1);
  ListNode? merge = Solution().mergeTwoLists(list1, list2);

  print("Two node merges lst ${merge?.toList()}");
}

extension ListNodeExtension on ListNode {
  ListNode newThis() {
    final node = this;
    ListNode? newNode = ListNode(node.val);
    ListNode? toCopyTempNode = node.next;
    ListNode? newNodeModifier = newNode;

    while (true) {
      if (toCopyTempNode == null) break;
      newNodeModifier?.next = ListNode(toCopyTempNode.val);
      toCopyTempNode = toCopyTempNode.next;
      newNodeModifier = newNodeModifier?.next;
    }
    return newNode;
  }

  ({ListNode start, ListNode end}) copy() {
    final node = this;
    ListNode startNode = ListNode(node.val);
    ListNode endNode = ListNode();
    ListNode? toCopyTempNode = node.next;
    ListNode? nextNode = startNode;

    while (true) {
      if (toCopyTempNode == null) break;
      nextNode?.next = ListNode(toCopyTempNode.val);
      toCopyTempNode = toCopyTempNode.next;
      if (toCopyTempNode == null) endNode = nextNode!.next!;
      nextNode = nextNode?.next;
    }

    return (start: startNode, end: endNode);
  }

  List<int> toList() {
    final node = this;
    List<int> newList = [];

    ListNode startNode = ListNode(node.val);
    ListNode? toCopyTempNode = node.next;
    ListNode? nextNode = startNode;

    while (true) {
      if (nextNode?.val != null) newList.add(nextNode!.val);
      if (toCopyTempNode == null) break;

      nextNode?.next = ListNode(toCopyTempNode.val);
      toCopyTempNode = toCopyTempNode.next;
      nextNode = nextNode?.next;
    }
    return newList;
  }
}

ListNode toListNode(List<int> list) {
  final node = ListNode(list[0]);
  ListNode nextNode = node;
  for (int i = 1; i < list.length; i++) {
    nextNode.next = ListNode(list[i]);
    nextNode = nextNode.next!;
  }
  return node;
}

void quickSort(List<int> arr, int low, int high) {
  if (low < high) {
    int p = _partition(arr, low, high);
    quickSort(arr, low, p); // Sort left side
    quickSort(arr, p + 1, high); // Sort right side
  }
}

int _partition(List<int> arr, int low, int high) {
  int pivot = arr[low + (high - low) ~/ 2];
  int i = low - 1;
  int j = high + 1;

  while (true) {
    do {
      i++;
    } while (arr[i] < pivot);
    do {
      j--;
    } while (arr[j] > pivot);

    if (i >= j) return j;

    // Swap elements
    int temp = arr[i];
    arr[i] = arr[j];
    arr[j] = temp;
  }
}
