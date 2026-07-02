/// Rookie version
///
///
class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

/**
 * Definition for singly-linked list.
 * class ListNode {
 *   int val;
 *   ListNode? next;
 *   ListNode([this.val = 0, this.next]);
 * }
 */
class Solution {
  ListNode? mergeTwoLists(ListNode? list1, ListNode? list2) {
    if (list1 == null) return list2;
    if (list2 == null) return list1;

    ListNode? list1Cpy = list1;
    ListNode? list2Cpy = list2;

    ListNode head;
    ListNode? mergedList;
    if (list1Cpy.val >= list2Cpy.val) {
      head = ListNode(list2Cpy.val);
      list2Cpy = list2Cpy.next;
    } else {
      head = ListNode(list1Cpy.val);
      list1Cpy = list1Cpy.next;
    }
    mergedList = head;

    while (list1Cpy != null || list2Cpy != null) {
      if (list1Cpy != null && list2Cpy != null) {
        if (list1Cpy.val >= list2Cpy.val) {
          if (mergedList != null) mergedList.next = ListNode(list2Cpy.val);
          list2Cpy = list2Cpy.next;
        } else {
          if (mergedList != null) mergedList.next = ListNode(list1Cpy.val);
          list1Cpy = list1Cpy.next;
        }
      } else {
        final lastCpy = (list2Cpy?.val ?? list1Cpy?.val);
        if (lastCpy != null) mergedList?.next = ListNode(lastCpy);
        if (list2Cpy != null) list2Cpy = list2Cpy.next;
        if (list1Cpy != null) list1Cpy = list1Cpy.next;
      }

      mergedList = mergedList?.next;
    }
    return head;
  }
}
