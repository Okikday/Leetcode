
// Definition for a Node.
class Node {
    public int val;
    public Node prev;
    public Node next;
    public Node child;
};

class Solution {
    ArrayList<Integer> acc = new ArrayList();
    public Node flatten(Node head) {
        if(head == null) return head;

        Node curr = head;
        while(curr != null){
            if(curr.child != null){
                Node next = curr.next;
                Node child = curr.child;

                curr.next = child;
                child.prev = curr;
                curr.child = null;

                Node tail = child;
                while(tail.next != null){
                    tail = tail.next;
                }

                tail.next = next;
                if(next != null){
                    next.prev = tail;
                }
            }
            curr = curr.next;
        }
        return head;
    }
}