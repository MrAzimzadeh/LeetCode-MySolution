class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

class Solution {
  ListNode? addTwoNumbers(ListNode? l1, ListNode? l2) {
    ListNode dummyHead = ListNode();
    ListNode? current = dummyHead;
    int carry = 0;

    while (l1 != null || l2 != null || carry != 0) {
      int value1 = l1 != null ? l1.val : 0;
      int value2 = l2 != null ? l2.val : 0;

      int sum = value1 + value2 + carry;
      carry = sum ~/ 10;

      current?.next = ListNode(sum % 10);
      current = current?.next;

      if (l1 != null) l1 = l1.next;
      if (l2 != null) l2 = l2.next;
    }

    return dummyHead.next;
  }
}
